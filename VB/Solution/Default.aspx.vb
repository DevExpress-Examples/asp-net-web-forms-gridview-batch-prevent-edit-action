Imports System
Imports System.Web.UI
Imports System.Web.UI.WebControls

Namespace Solution

    Public Partial Class [Default]
        Inherits Page

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        End Sub

        Protected Sub ASPxGridView1_BatchUpdate(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataBatchUpdateEventArgs)
            'Data editing is not allowed in the example
            e.Handled = True
        End Sub
    End Class
End Namespace
