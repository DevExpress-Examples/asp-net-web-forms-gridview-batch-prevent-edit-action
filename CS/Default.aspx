<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
	<title>ASPxGridView - How to use the client-side FocusedCellChanging</title>
	
	<script type="text/javascript">
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
	</script>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" KeyFieldName="ProductID" OnBatchUpdate="ASPxGridView1_BatchUpdate">
				<Columns>
                    <dx:GridViewCommandColumn ShowEditButton="true" VisibleIndex="0" Name="command"></dx:GridViewCommandColumn>
					<dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="1">
						<EditFormSettings Visible="False"></EditFormSettings>
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="2">
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="SupplierID" VisibleIndex="3">
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="CategoryID" VisibleIndex="4">
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="5">
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="UnitsInStock" VisibleIndex="6">
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="UnitsOnOrder" VisibleIndex="6">
					</dx:GridViewDataTextColumn>
				</Columns>
                <SettingsEditing Mode="Batch"></SettingsEditing>
                <ClientSideEvents FocusedCellChanging="onFocusedCellChanging" />
			</dx:ASPxGridView>
			<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
				SelectCommand="SELECT [ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [UnitsInStock], [UnitsOnOrder] FROM [Products]"></asp:AccessDataSource>
		</div>
	</form>
</body>
</html>
