<%@ Page Title="" Language="C#" MasterPageFile="~/MXRAY/XRAY.master" AutoEventWireup="true"
    CodeFile="patient.aspx.cs" Inherits="MXRAY_patient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="Server">
    <li><i class="fa fa-dashboard"></i>Patient</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <div class="box-header module-header">
        <span><i class="fa fa-user-md"></i></span>&nbsp;X-ray</div>
    <div style="padding: 20px" class=" container box box-solid">
        <h4>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT * FROM [PatientInfo] WHERE ([Name] = @Name)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Name" QueryStringField="name" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            Patient Detail</h4>
        <div class="col-md-3">
            <asp:Label ID="Label1" runat="server" Text="Account No." CssClass="col-md-7" 
                Font-Bold="True" Font-Size="Large"></asp:Label>
            <asp:Label ID="lblAccountNo" runat="server" Text="Label" CssClass="col-md-5"></asp:Label>
        </div>
        <div class="col-md-3">
            <asp:Label ID="Label2" runat="server" Text="Label" CssClass="col-md-7" Font-Bold="True" Font-Size="Large">Matrix No.</asp:Label>
            <asp:Label ID="lblMatrixNo" runat="server" Text="Label" CssClass="col-md-5"></asp:Label>
        </div>
        <div class="col-md-3">
            <asp:Label ID="Label4" runat="server" Text="Label" CssClass="col-md-7" Font-Bold="True" Font-Size="Large">Registration Type.</asp:Label>
            <asp:Label ID="Label5" runat="server" Text="Label" CssClass="col-md-5">Student</asp:Label>
        </div>
        <div id="clock" class="clock col-md-3 text-center">
        </div>
        <div class="col-md-4">
            <asp:Label ID="Label6" runat="server" Text="Label" CssClass="col-md-7" Font-Bold="True" Font-Size="Large">Name</asp:Label>
            <asp:Label ID="lblName" runat="server" Text="Label" CssClass="col-md-5"></asp:Label>
        </div>
    </div>
    <div class="container box box-solid">
    </div>
    <div class=" container box-solid col-md-3" style="padding-left: 0">
        <div class="box-header red " style="color: White;">
            Request
        </div>
        <div style="border-right: solid 1px rgba(128, 128, 128, 0.22); background: white;
            padding: 10px 10px; margin-bottom: 10px;">
            <label for="exampleSelect2">
                Example multiple select</label>
            <select multiple class="form-control" id="exampleSelect2">
                <option id="RME">RME</option>
                <option id="Knee">Knee</option>
                <option>KUB</option>
                <option>Lumbosacral</option>
                <option>Mandible</option>
                <option>Mastoids</option>
                <option>Maxilla</option>
                <option>Nasal Bone</option>
                <option>Pelvis</option>
                <option>PNS</option>
            </select>
        </div>
    </div>
    <div class=" container box-solid col-md-9" style="padding-left: 0">
        <div class="box-header red" style="margin: 0">
            Order
        </div>
        <div class="bgwhite">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT * FROM [Xray] WHERE ([name] = @name)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="name" QueryStringField="name" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                CssClass="table table-bordered">
                <Columns>
                    <asp:BoundField DataField="account_no" HeaderText="account_no" SortExpression="account_no" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />                    
                    <asp:BoundField DataField="create_date" HeaderText="create_date" SortExpression="create_date" />
                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                    <asp:BoundField DataField="class_name" HeaderText="class_name" SortExpression="class_name" />
                    <asp:BoundField DataField="part_name" HeaderText="part_name" SortExpression="part_name" />
                </Columns>
                <HeaderStyle CssClass="table black"/>

            </asp:GridView>
            <div class="box-body">
            <form>
                <div class="col-md-6 ">
                    <label for="class" class="">
                        Class</label>
                    <input type="text" class="form-control" id="class" disabled>
                    <label for="class" class="">
                        Part</label>
                    <input type="text" class="form-control" id="part" disabled>
                    <label for="class" class="">
                        Dr's Remark</label>
                    <textarea rows="3" class="form-control" id="Text1" disabled></textarea>
                </div>
                 <div class="col-md-6 ">
                    <label for="class" class="">View</label>
                    <input type="text" class="form-control" id="view" disabled>
                    <div class="col-md-6 ">
                     <label for="class" class="">
                        Position</label>
                    <input type="text" class="form-control" id="position" disabled>
                    </div>
                    <div class="col-md-6 nopadding">
                     <label for="class" class="">
                        Charge</label>
                    <input type="text" class="form-control" id="charge" disabled>
                    </div>
                   
                    <label for="class" class="">
                       Radiographer's remark</label>
                    <textarea rows="3" class="form-control" id="Textarea1" ></textarea>
                </div>
               
               <button class="btn btn-success pull-right" ID="btnsave" runat="server" onserverclick="btnsave_click" style="margin:10px;"><span><i class="fa fa-save"></i></span>&nbsp;Save</button>
               <button  class="btn btn-danger pull-right" type="reset" style="margin:10px;"><span><i class="fa fa-close"></i></span>&nbsp;Cancel</button>
               </form>
               
               
            </div>
        </div>
        <div class="col-md-8">
        </div>
        
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="Server">

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="js" runat="Server">
<script>
    $("#RME").on("click", function () {
        $("#class").val("RME");
        $("#part").val("Chest");
        $("#view").val("Front");
        $("#position").val("Horizontal");
        $("#charge").val("RM35");

    });

    $("#Knee").on("click", function () {
        $("#class").val("Knee");
        $("#part").val("Knee Cap");
        $("#view").val("Aerial");
        $("#position").val("Vertical");
        $("#charge").val("RM35");

    });
        </script>
</asp:Content>
