<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/134059439/17.1.3%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/T496531)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
[![](https://img.shields.io/badge/💬_Leave_Feedback-feecdd?style=flat-square)](#does-this-example-address-your-development-requirementsobjectives)
<!-- default badges end -->
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


<!-- feedback -->
## Does this example address your development requirements/objectives?

[<img src="https://www.devexpress.com/support/examples/i/yes-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=aspxgridview-prevent-batch-edit-action&~~~was_helpful=yes) [<img src="https://www.devexpress.com/support/examples/i/no-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=aspxgridview-prevent-batch-edit-action&~~~was_helpful=no)

(you will be redirected to DevExpress.com to submit your response)
<!-- feedback end -->
