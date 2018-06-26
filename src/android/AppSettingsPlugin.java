package by.chemerisuk.cordova.settigns;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.util.Log;

import by.chemerisuk.cordova.support.CordovaMethod;
import by.chemerisuk.cordova.support.ReflectiveCordovaPlugin;
import by.chemerisuk.cordova.support.ReflectiveCordovaPlugin.ExecutionThread;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
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
        } else if (sharedPrefs.contains(key)) {
            callbackContext.success(sharedPrefs.getString(key, ""));
        } else {
            callbackContext.sendPluginResult(
                new PluginResult(PluginResult.Status.OK, (String)null));
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

            if (sharedPrefsEditor.commit()) {
                callbackContext.success(value);
            } else {
                callbackContext.error("Synchronization failed");
            }
        }
    }

    @CordovaMethod(ExecutionThread.WORKER)
    protected void getBoolean(String key, CallbackContext callbackContext) {
        if (key == null) {
            callbackContext.error("Key must not be blank");
        } else if (sharedPrefs.contains(key)) {
            boolean value = sharedPrefs.getBoolean(key, false);
            callbackContext.sendPluginResult(
                new PluginResult(PluginResult.Status.OK, value));
        } else {
            callbackContext.sendPluginResult(
                new PluginResult(PluginResult.Status.OK, (String)null));
        }
    }

    @CordovaMethod(ExecutionThread.WORKER)
    protected void setBoolean(String key, Boolean value, CallbackContext callbackContext) {
        if (key == null) {
            callbackContext.error("Key must not be blank");
        } else {
            if (value == null) {
                sharedPrefsEditor.remove(key);
            } else {
                sharedPrefsEditor.putBoolean(key, value);
            }

            if (sharedPrefsEditor.commit()) {
                callbackContext.sendPluginResult(
                    new PluginResult(PluginResult.Status.OK, value));
            } else {
                callbackContext.error("Synchronization failed");
            }
        }
    }

    @CordovaMethod(ExecutionThread.WORKER)
    protected void getNumber(String key, CallbackContext callbackContext) {
        if (key == null) {
            callbackContext.error("Key must not be blank");
        } else if (sharedPrefs.contains(key)) {
            float value = sharedPrefs.getFloat(key, 0);
            callbackContext.sendPluginResult(
                new PluginResult(PluginResult.Status.OK, value));
        } else {
            callbackContext.sendPluginResult(
                new PluginResult(PluginResult.Status.OK, (String)null));
        }
    }

    @CordovaMethod(ExecutionThread.WORKER)
    protected void setNumber(String key, Float value, CallbackContext callbackContext) {
        if (key == null) {
            callbackContext.error("Key must not be blank");
        } else {
            if (value == null) {
                sharedPrefsEditor.remove(key);
            } else {
                sharedPrefsEditor.putFloat(key, value);
            }

            if (sharedPrefsEditor.commit()) {
                callbackContext.sendPluginResult(
                    new PluginResult(PluginResult.Status.OK, value));
            } else {
                callbackContext.error("Synchronization failed");
            }
        }
    }
}
