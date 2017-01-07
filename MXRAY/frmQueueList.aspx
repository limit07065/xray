<%@ Page Title="" Language="C#" MasterPageFile="~/MXRAY/XRAY.master" AutoEventWireup="true"
    CodeFile="frmQueueList.aspx.cs" Inherits="MXRAY_frmQueueList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <section class="content-header">
        <h1 style="color:#DD4B39; font-weight: bold; padding-bottom:15px;">
            X-Ray
            <small>Xray</small>
        </h1>
    </section>
    <div class="box box-success">
        <div class="box-header with-border">
            <h3 class="box-title">
                Queue List</h3>
            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse">
                    <i class="fa fa-minus"></i>
                </button>
            </div>
        </div>
        <div class="box-body">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-hover"
                        DataSourceID="SqlDataSource1" AllowPaging="True" EmptyDataText="Patient Record Not Found"
                        ForeColor="#333333" HorizontalAlign="Center" Width="90%" EnableViewState="False"
                        GridLines="None" Font-Size="15px" AllowSorting="True">
                        <Columns>
                            <asp:HyperLinkField DataTextField="Name" DataNavigateUrlFields="Name" DataNavigateUrlFormatString="patient.aspx?name={0}"
                                Target="_blank" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" SortExpression="CreatedDate" />                            
                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#00A65A" Font-Bold="True" ForeColor="White" />
                        <PagerSettings Mode="NumericFirstLast" Position="Bottom" PageButtonCount="10" />
                        <PagerStyle HorizontalAlign="Center" CssClass="paging" ForeColor="#337AB7" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#D8D8D4" ForeColor="Blue" Font-Bold="True" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT * FROM [QueueList] WHERE ([StatusActive] = @StatusActive)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Y" Name="StatusActive" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <!-- /.box-body -->
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="breadcrumb" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>
