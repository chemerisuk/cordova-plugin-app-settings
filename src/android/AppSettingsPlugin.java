package by.chemerisuk.cordova.settigns;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.util.Log;

import by.chemerisuk.cordova.support.CordovaMethod;
import by.chemerisuk.cordova.support.ReflectiveCordovaPlugin;
import by.chemerisuk.cordova.support.ReflectiveCordovaPlugin.ExecutionThread;

import org.apache.cordova.CallbackContext;
import org.json.JSONObject;
import org.json.JSONException;


public class AppSettingsPlugin extends ReflectiveCordovaPlugin {
    private static final String TAG = "AppSettingsPlugin";

    private SharedPreferences sharedPrefs;
    private SharedPreferences.Editor sharedPrefsEditor;

    @Override
    protected void pluginInitialize() {
        Log.d(TAG, "Starting App Settings plugin");

        Context context = this.cordova.getActivity();

        this.sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        this.sharedPrefsEditor = sharedPrefs.edit();
    }

    @CordovaMethod(ExecutionThread.WORKER)
    protected void getString(String key, CallbackContext callbackContext) {
        if (key == null) {
            callbackContext.error("Key must not be blank");
        } else {
            callbackContext.success(sharedPrefs.getString(key, ""));
        }
    }

    @CordovaMethod(ExecutionThread.WORKER)
    protected void setString(String key, String value, CallbackContext callbackContext) {
        if (key == null) {
            callbackContext.error("Key must not be blank");
        } else {
            if (value == null) {
                sharedPrefsEditor.remove(key);
            } else {
                sharedPrefsEditor.putString(key, value);
            }

            boolean success = sharedPrefsEditor.commit();
            if (success) {
                callbackContext.success(value);
            } else {
                callbackContext.error("Synchronization failed");
            }
        }
    }
}
