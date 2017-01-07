<%@ Page Title="" Language="C#" MasterPageFile="~/boardMain.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="default.aspx.cs" Inherits="MRME_queue" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!-- jQuery 2.2.3 -->
    <script src="../plugins/jQuery/jquery-2.2.3.min.js" type="text/javascript"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- AdminLTE App -->
    <script src="../dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="../dist/js/demo.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js" type="text/javascript"></script>
    <!-- RME custom css -->
    <link href="../bootstrap/css/rmeStyleSheet.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <section class="content-header">
        <h1 style="color:#DD4B39; font-weight: bold; padding-bottom:15px;">
            Routine Medical Examination
            <small>RME</small>
        </h1>
    </section>
    <div class="box box-success">
        <div class="box-header with-border">
            <h3 class="box-title">Queue List</h3>
            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
            </div>
        </div>
        <div class="box-body">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-hover"
                DataSourceID="SqlDataSource1" AllowPaging="True" EmptyDataText="Patient Record Not Found"
                ForeColor="#333333" HorizontalAlign="Center" Width="90%" onselectedindexchanged="GridView1_SelectedIndexChanged"
                EnableViewState="False" onrowdatabound="GridView1_RowDataBound" onpageindexchanged="GridView1_PageIndexChanging"
                GridLines="None" PageSize="10" Font-Size="15px" 
                EnablePersistedSelection="True" DataKeyNames="Name">
                <Columns>
                    <asp:CommandField ShowSelectButton="False" />
                    <asp:HyperLinkField DataTextField="Name" DataNavigateUrlFields="Name" datanavigateurlformatstring="~\MRME\patient.aspx?name={0}" target="_blank" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="part1" HeaderText="General" SortExpression="part1" />
                    <asp:BoundField DataField="part2" HeaderText="Medical History" SortExpression="part2" />
                    <asp:BoundField DataField="part3" HeaderText="Body System" SortExpression="part3" />
                    <asp:BoundField DataField="part4" HeaderText="Lab" SortExpression="part4" />
                    <asp:BoundField DataField="Status" HeaderText="Verification" SortExpression="Status" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#00A65A" Font-Bold="True" ForeColor="White" />
                <PagerSettings mode="NumericFirstLast" position="Bottom" pagebuttoncount="10"/>
                <PagerStyle HorizontalAlign="Center" CssClass="paging" ForeColor="#337AB7" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#D8D8D4" ForeColor="Blue" Font-Bold="True" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT Name, part1, part2, part3, part4, Status FROM QueueList WHERE (StatusActive = 'Y') AND (Status = 0)" >
            </asp:SqlDataSource>
            <div style="text-align:center;">
                <button type="button" style="width: 120px;" class="btn btn-default btn-sm" onclick="window.location.reload()">
                    <span class="glyphicon glyphicon-refresh"></span> Refresh
                </button>
            </div>
        </div>
        <!-- /.box-body -->
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
<!-- SlimScroll -->
    <script src="../plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src="../plugins/fastclick/fastclick.js" type="text/javascript"></script>
</asp:Content>

