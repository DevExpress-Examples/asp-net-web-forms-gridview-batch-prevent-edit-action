<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/134059439/17.1.3%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/T496531)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->

# ASP.NET - Handle the client-side FocusedCellChanging event to prevent an edit action for ASPxGridView cells

This example handles the client-side [`FocusedCellChanging`](https://docs.devexpress.com/AspNet/js-ASPxClientGridView.FocusedCellChanging) event to prevent users from editing corresponding grid cells in [batch edit mode](https://docs.devexpress.com/AspNet/16443/components/grid-view/concepts/edit-data/batch-edit-mode).

<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/t496531/)**
<!-- run online end -->

## Files to look at

* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/Default.aspx.vb))


## Implementation Details

On the client side, the [`FocusedCellChanging`](https://docs.devexpress.com/AspNet/js-ASPxClientGridView.FocusedCellChanging) event contains clicked cell data of the [`ASPxClientGridViewCellInfo`](https://docs.devexpress.com/AspNet/js-ASPxClientGridViewCellInfo) class. To get this data, the code below uses the event handler argument's [`cellInfo`](https://docs.devexpress.com/AspNet/js-ASPxClientGridViewFocusedCellChangingEventArgs.cellInfo) property.

Depending on the obtained data, the handler determines whether a user can focus and then edit the clicked cell. For this purpose, the code specifies the handler argument's [`cancel`](https://docs.devexpress.com/AspNet/js-ASPxClientCancelEventArgs.cancel) property. When the [`cancel`](https://docs.devexpress.com/AspNet/js-ASPxClientCancelEventArgs.cancel) property is **true**, the grid cancels the focus action for the clicked cell.

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

Note that this technique does not work if you set the [`EditMode`](https://docs.devexpress.com/AspNet/DevExpress.Web.GridViewBatchEditSettings.EditMode) property to **Row**. A user can focus and then edit any cell in the row switched to edit mode (except for cells of columns with the enabled [`ReadOnly`](https://docs.devexpress.com/AspNet/DevExpress.Web.GridViewDataColumn.ReadOnly) property).
