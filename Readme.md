<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/134059439/21.2.4%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/T496531)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->

# ASP.NET - Handle the client-side FocusedCellChanging event to prevent an edit action for ASPxGridView cells

This example handles the client-side [`FocusedCellChanging`](https://docs.devexpress.com/AspNet/js-ASPxClientGridView.FocusedCellChanging) event to prevent users from editing corresponding grid cells in [batch edit mode](https://docs.devexpress.com/AspNet/16443/components/grid-view/concepts/edit-data/batch-edit-mode).

<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/134059439/)**
<!-- run online end -->

## Files to Look At

* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/Default.aspx.vb))


## Implementation Details

The following client-side [`FocusedCellChanging`](https://docs.devexpress.com/AspNet/js-ASPxClientGridView.FocusedCellChanging) event handler specifies the [`e.Cancel`](https://docs.devexpress.com/AspNet/js-ASPxClientCancelEventArgs.cancel) property to cancel the focus action (and subsequent edit operations) for cells in specific columns and rows. The code uses the [`e.cellInfo`](https://docs.devexpress.com/AspNet/js-ASPxClientGridViewFocusedCellChangingEventArgs.cellInfo) event property to get information on the clicked cell's column and row.


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

This technique is not applicable if you set the [`EditMode`](https://docs.devexpress.com/AspNet/DevExpress.Web.GridViewBatchEditSettings.EditMode) property to **Row**. A user can focus and edit any cell in the row switched to edit mode except for cells in read-only columns (the [`GridViewDataColumn.ReadOnly`](https://docs.devexpress.com/AspNet/DevExpress.Web.GridViewDataColumn.ReadOnly) property).
