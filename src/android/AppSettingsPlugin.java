package by.chemerisuk.cordova.settigns;

import android.content.Context;

import by.chemerisuk.cordova.support.CordovaMethod;
import by.chemerisuk.cordova.support.ReflectiveCordovaPlugin;
import by.chemerisuk.cordova.support.ReflectiveCordovaPlugin.ExecutionThread;

import org.apache.cordova.CallbackContext;
import org.json.JSONObject;
import org.json.JSONException;


public class AppSettingsPlugin extends ReflectiveCordovaPlugin {
    private static final String TAG = "AppSettingsPlugin";

    @CordovaMethod(ExecutionThread.WORKER)
    protected void getString(String key, CallbackContext callbackContext) {

    }

    @CordovaMethod(ExecutionThread.WORKER)
    protected void setString(String key, String value, CallbackContext callbackContext) {

    }
}
