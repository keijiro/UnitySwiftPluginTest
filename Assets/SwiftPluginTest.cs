using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.UI;
using System.Runtime.InteropServices;
using IntPtr = System.IntPtr;

sealed class SwiftPluginTest : MonoBehaviour
{
    [SerializeField] Text _label = null;

    [DllImport("SwiftPlugin.dll", EntryPoint = "plugin_create")]
    private static extern IntPtr PluginCreate(int value);

    [DllImport("SwiftPlugin.dll", EntryPoint = "plugin_set_param1")]
    private static extern void PluginSetParam1(IntPtr self, int value);

    [DllImport("SwiftPlugin.dll", EntryPoint = "plugin_set_param2")]
    private static extern void PluginSetParam2(IntPtr self, string text);

    [DllImport("SwiftPlugin.dll", EntryPoint = "plugin_get_sum")]
    private static extern int PluginGetSum(IntPtr self);

    [DllImport("SwiftPlugin.dll", EntryPoint = "plugin_destroy")]
    private static extern void PluginDestroy(IntPtr self);

    void Start()
    {
        {
            var ptr = PluginCreate(0);
            Assert.AreEqual(ptr, IntPtr.Zero);
        }

        {
            var ptr = PluginCreate(1);
            PluginSetParam1(ptr, 1);
            PluginSetParam2(ptr, "2");
            _label.text = $"1 + 2 = {PluginGetSum(ptr)}";
            PluginDestroy(ptr);
        }
    }
}
