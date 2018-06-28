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
        PluginResult pluginResult = verifyKey(key, true);
        if (pluginResult == null) {
            String value = sharedPrefs.getString(key, "");
            pluginResult = new PluginResult(PluginResult.Status.OK, value);
        }
        callbackContext.sendPluginResult(pluginResult);
    }

    @CordovaMethod(ExecutionThread.WORKER)
    protected void setString(String key, String value, CallbackContext callbackContext) {
        PluginResult pluginResult = verifyKey(key, false);
        if (pluginResult == null) {
            if (value == null) {
                sharedPrefsEditor.remove(key);
            } else {
                sharedPrefsEditor.putString(key, value);
            }

            if (sharedPrefsEditor.commit()) {
                pluginResult = new PluginResult(PluginResult.Status.OK, value);
            } else {
                pluginResult = new PluginResult(PluginResult.Status.ERROR, "Synchronization failed");
            }
        }
        callbackContext.sendPluginResult(pluginResult);
    }

    @CordovaMethod(ExecutionThread.WORKER)
    protected void getBoolean(String key, CallbackContext callbackContext) {
        PluginResult pluginResult = verifyKey(key, true);
        if (pluginResult == null) {
            boolean value = sharedPrefs.getBoolean(key, false);
            pluginResult = new PluginResult(PluginResult.Status.OK, value);
        }
        callbackContext.sendPluginResult(pluginResult);
    }

    @CordovaMethod(ExecutionThread.WORKER)
    protected void setBoolean(String key, Boolean value, CallbackContext callbackContext) {
        PluginResult pluginResult = verifyKey(key, false);
        if (pluginResult == null) {
            if (value == null) {
                sharedPrefsEditor.remove(key);
            } else {
                sharedPrefsEditor.putBoolean(key, value);
            }

            if (sharedPrefsEditor.commit()) {
                pluginResult = new PluginResult(PluginResult.Status.OK, value);
            } else {
                pluginResult = new PluginResult(PluginResult.Status.ERROR, "Synchronization failed");
            }
        }
        callbackContext.sendPluginResult(pluginResult);
    }

    @CordovaMethod(ExecutionThread.WORKER)
    protected void getNumber(String key, CallbackContext callbackContext) {
        PluginResult pluginResult = verifyKey(key, true);
        if (pluginResult == null) {
            float value = sharedPrefs.getFloat(key, 0);
            pluginResult = new PluginResult(PluginResult.Status.OK, value);
        }
        callbackContext.sendPluginResult(pluginResult);
    }

    @CordovaMethod(ExecutionThread.WORKER)
    protected void setNumber(String key, Float value, CallbackContext callbackContext) {
        PluginResult pluginResult = verifyKey(key, false);
        if (pluginResult == null) {
            if (value == null) {
                sharedPrefsEditor.remove(key);
            } else {
                sharedPrefsEditor.putFloat(key, value);
            }

            if (sharedPrefsEditor.commit()) {
                pluginResult = new PluginResult(PluginResult.Status.OK, value);
            } else {
                pluginResult = new PluginResult(PluginResult.Status.ERROR, "Synchronization failed");
            }
        }
        callbackContext.sendPluginResult(pluginResult);
    }

    private PluginResult verifyKey(String key, boolean mustExists) {
        if (key == null) {
            return new PluginResult(PluginResult.Status.ERROR, "Key must not be blank");
        } else if (mustExists && !sharedPrefs.contains(key)) {
            return new PluginResult(PluginResult.Status.OK, (String)null);
        } else {
            return null;
        }
    }
}
