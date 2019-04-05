<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/Default.aspx.vb))
<!-- default file list end -->
# ASPxGridView - Batch Edit - Cancel editor/row editing in the client FocusedCellChanging event


Starting from version 17.1 we have introduced a new client-side <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebScriptsASPxClientGridView_FocusedCellChangingtopic">FocusedCellChanging</a> event. This event allows you to skip focusing and editing a cell. <br>This example demonstrates different ways to skip or prevent editing certain cells.<br>The main idea is to get the currently focused cell using the <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebScriptsASPxClientGridViewFocusedCellChangingEventArgs_cellInfotopic">ASPxClientGridViewFocusedCellChangingEventArgs.cellInfo</a> property and decide whether it is required to skip focusing or not:<br>


```js
function onFocusedCellChanging(s, e) {
    if (e.cellInfo.column.name == 'command')
        e.cancel = true;
    else if (e.cellInfo.column.fieldName == 'SupplierID')
        e.cancel = true;
    else if (e.cellInfo.column.fieldName == 'UnitsInStock' && (e.cellInfo.rowVisibleIndex < 3 || e.cellInfo.rowVisibleIndex > 7))
        e.cancel = true;
    else if (e.cellInfo.column.fieldName == 'UnitPrice' && s.batchEditApi.GetCellValue(e.cellInfo.rowVisibleIndex, 'UnitPrice') > 22)
        e.cancel = true;
}
```


<p><strong>Note</strong>: the FocusedCellChanging event can't prevent editor focusing if the <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridView_SettingsEditingtopic">ASPxGridView.SettingsEditing</a> -> <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewEditingSettings_BatchEditSettingstopic">BatchEditSettings</a> -> <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebGridViewBatchEditSettings_EditModetopic">EditMode</a> property is set to Row.</p>

<br/>


