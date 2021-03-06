﻿<%@ Page Title="" Language="C#" MasterPageFile="~/boardMain.master" AutoEventWireup="true" CodeFile="queueList.aspx.cs" Inherits="MRME_queueList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!-- jQuery 2.2.3 -->
    <script src="../plugins/jQuery/jquery-2.2.3.min.js" type="text/javascript"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- SlimScroll -->
    <script src="../plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src="../plugins/fastclick/fastclick.js" type="text/javascript"></script>
    <!-- AdminLTE App -->
    <script src="../dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="../dist/js/demo.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>

    <!-- RME custom css -->
    <link href="../bootstrap/css/rmeStyleSheet.css" rel="stylesheet" type="text/css" />
    <script>
        //document.addEventListener("DOMContentLoaded", function () {
        //});

        function displaySelectedPart(id) {
            var a1 = document.getElementById("numListOne");
            var a2 = document.getElementById("numListTwo");
            var a3 = document.getElementById("numListThree");
            var a4 = document.getElementById("numListFour");
            var a5 = document.getElementById("numListFive");

            var ul1 = document.getElementById("ulPartOne");
            var ul2 = document.getElementById("ulPartTwo");
            var ul3 = document.getElementById("ulPartThree");
            var ul4 = document.getElementById("ulPartFour");
            var ul5 = document.getElementById("ulPartFive");

            if (id == "numListOne") {
                document.getElementById("partOne").style.display = "block";
                document.getElementById("partTwo").style.display = "none";
                document.getElementById("partThree").style.display = "none";
                document.getElementById("partFour").style.display = "none";
                document.getElementById("partFive").style.display = "none";

                if (a1.className != "active") {
                    if (a1.classList) {
                        a1.classList.add("active");
                        ul1.classList.add("activeList");
                    }
                    else {
                        a1.className = "active";      // For IE9 and earlier
                        ul1.className = "activeList"; // For IE9 and earlier
                    }
                }
                if (a2.className == "active") {
                    if (a2.classList) {
                        a2.classList.remove("active");
                        ul2.classList.remove("activeList");
                    }
                    else {
                        a2.className = a2.className.replace(/\bactive\b/g, "");       // For IE9 and earlier
                        ul2.className = ul2.className.replace(/\bactiveList\b/g, ""); // For IE9 and earlier
                    }
                }
                else if (a3.className == "active") {
                    if (a3.classList) {
                        a3.classList.remove("active");
                        ul3.classList.remove("activeList");
                    }
                    else {
                        a3.className = a3.className.replace(/\bactive\b/g, "");       // For IE9 and earlier
                        ul3.className = ul3.className.replace(/\bactiveList\b/g, ""); // For IE9 and earlier
                    }
                }
                else if (a4.className == "active") {
                    if (a4.classList) {
                        a4.classList.remove("active");
                        ul4.classList.remove("activeList");
                    }
                    else {
                        a4.className = a4.className.replace(/\bactive\b/g, "");       // For IE9 and earlier
                        ul4.className = ul4.className.replace(/\bactiveList\b/g, ""); // For IE9 and earlier
                    }
                }
                else if (a5.className == "active") {
                    if (a5.classList) {
                        a5.classList.remove("active");
                        ul5.classList.remove("activeList");
                    }
                    else {
                        a5.className = a5.className.replace(/\bactive\b/g, "");       // For IE9 and earlier
                        ul5.className = ul5.className.replace(/\bactiveList\b/g, ""); // For IE9 and earlier
                    }
                }
            }
            else if (id == "numListTwo") {
                document.getElementById("partOne").style.display = "none";
                document.getElementById("partThree").style.display = "none";
                document.getElementById("partFour").style.display = "none";
                document.getElementById("partFive").style.display = "none";
                document.getElementById("partTwo").style.display = "block";

                if (a2.className != "active") {
                    if (a2.classList) {
                        a2.classList.add("active");
                        ul2.classList.add("activeList");
                    }
                    else {
                        a2.className = "active";      // For IE9 and earlier
                        ul2.className = "activeList"; // For IE9 and earlier
                    }
                }
                if (a1.className == "active") {
                    if (a1.classList) {
                        a1.classList.remove("active");
                        ul1.classList.remove("activeList");
                    }
                    else {
                        a1.className = a1.className.replace(/\bactive\b/g, "");       // For IE9 and earlier
                        ul1.className = ul1.className.replace(/\bactiveList\b/g, ""); // For IE9 and earlier
                    }
                }
                else if (a3.className == "active") {
                    if (a3.classList) {
                        a3.classList.remove("active");
                        ul3.classList.remove("activeList");
                    }
                    else {
                        a3.className = a3.className.replace(/\bactive\b/g, "");       // For IE9 and earlier
                        ul3.className = ul3.className.replace(/\bactiveList\b/g, ""); // For IE9 and earlier
                    }
                }
                else if (a4.className == "active") {
                    if (a4.classList) {
                        a4.classList.remove("active");
                        ul4.classList.remove("activeList");
                    }
                    else {
                        a4.className = a4.className.replace(/\bactive\b/g, "");       // For IE9 and earlier
                        ul4.className = ul4.className.replace(/\bactiveList\b/g, ""); // For IE9 and earlier
                    }
                }
                else if (a5.className == "active") {
                    if (a5.classList) {
                        a5.classList.remove("active");
                        ul5.classList.remove("activeList");
                    }
                    else {
                        a5.className = a5.className.replace(/\bactive\b/g, "");       // For IE9 and earlier
                        ul5.className = ul5.className.replace(/\bactiveList\b/g, ""); // For IE9 and earlier
                    }
                }
            }
            else if (id == "numListThree") {
                document.getElementById("partOne").style.display = "none";
                document.getElementById("partTwo").style.display = "none";
                document.getElementById("partFour").style.display = "none";
                document.getElementById("partFive").style.display = "none";
                document.getElementById("partThree").style.display = "block";

                if (a3.className != "active") {
                    if (a3.classList) {
                        a3.classList.add("active");
                        ul3.classList.add("activeList");
                    }
                    else {
                        a3.className = "active";      // For IE9 and earlier
                        ul3.className = "activeList"; // For IE9 and earlier
                    }
                }
                if (a1.className == "active") {
                    if (a1.classList) {
                        a1.classList.remove("active");
                        ul1.classList.remove("activeList");
                    }
                    else {
                        a1.className = a1.className.replace(/\bactive\b/g, "");       // For IE9 and earlier
                        ul1.className = ul1.className.replace(/\bactiveList\b/g, ""); // For IE9 and earlier
                    }
                }
                else if (a2.className == "active") {
                    if (a2.classList) {
                        a2.classList.remove("active");
                        ul2.classList.remove("activeList");
                    }
                    else {
                        a2.className = a2.className.replace(/\bactive\b/g, "");       // For IE9 and earlier
                        ul2.className = ul2.className.replace(/\bactiveList\b/g, ""); // For IE9 and earlier
                    }
                }
                else if (a4.className == "active") {
                    if (a4.classList) {
                        a4.classList.remove("active");
                        ul4.classList.remove("activeList");
                    }
                    else {
                        a4.className = a4.className.replace(/\bactive\b/g, "");       // For IE9 and earlier
                        ul4.className = ul4.className.replace(/\bactiveList\b/g, ""); // For IE9 and earlier
                    }
                }
                else if (a5.className == "active") {
                    if (a5.classList) {
                        a5.classList.remove("active");
                        ul5.classList.remove("activeList");
                    }
                    else {
                        a5.className = a5.className.replace(/\bactive\b/g, "");       // For IE9 and earlier
                        ul5.className = ul5.className.replace(/\bactiveList\b/g, ""); // For IE9 and earlier
                    }
                }
            }
            else if (id == "numListFour") {
                document.getElementById("partOne").style.display = "none";
                document.getElementById("partTwo").style.display = "none";
                document.getElementById("partThree").style.display = "none";
                document.getElementById("partFive").style.display = "none";
                document.getElementById("partFour").style.display = "block";

                if (a4.className != "active") {
                    if (a4.classList) {
                        a4.classList.add("active");
                        ul4.classList.add("activeList");
                    } else {
                        a4.className = "active";      // For IE9 and earlier
                        ul4.className = "activeList"; // For IE9 and earlier
                    }
                }
                if (a1.className == "active") {
                    if (a1.classList) {
                        a1.classList.remove("active");
                        ul1.classList.remove("activeList");
                    }
                    else {
                        a1.className = a1.className.replace(/\bactive\b/g, "");       // For IE9 and earlier
                        ul1.className = ul1.className.replace(/\bactiveList\b/g, ""); // For IE9 and earlier
                    }
                }
                else if (a2.className == "active") {
                    if (a2.classList) {
                        a2.classList.remove("active");
                        ul2.classList.remove("activeList");
                    }
                    else {
                        a2.className = a2.className.replace(/\bactive\b/g, "");       // For IE9 and earlier
                        ul2.className = ul2.className.replace(/\bactiveList\b/g, ""); // For IE9 and earlier
                    }
                }
                else if (a3.className == "active") {
                    if (a3.classList) {
                        a3.classList.remove("active");
                        ul3.classList.remove("activeList");
                    }
                    else {
                        a3.className = a3.className.replace(/\bactive\b/g, "");       // For IE9 and earlier
                        ul3.className = ul3.className.replace(/\bactiveList\b/g, ""); // For IE9 and earlier
                    }
                }
                else if (a5.className == "active") {
                    if (a5.classList) {
                        a5.classList.remove("active");
                        ul5.classList.remove("activeList");
                    }
                    else {
                        a5.className = a5.className.replace(/\bactive\b/g, "");       // For IE9 and earlier
                        ul5.className = ul5.className.replace(/\bactiveList\b/g, ""); // For IE9 and earlier
                    }
                }
            }
            else {
                document.getElementById("partOne").style.display = "none";
                document.getElementById("partTwo").style.display = "none";
                document.getElementById("partThree").style.display = "none";
                document.getElementById("partFour").style.display = "none";
                document.getElementById("partFive").style.display = "block";

                if (a5.className != "active") {
                    if (a5.classList) {
                        a5.classList.add("active");
                        ul5.classList.add("activeList");
                    } else {
                        a5.className = "active";      // For IE9 and earlier
                        ul5.className = "activeList"; // For IE9 and earlier
                    }
                }
                if (a1.className == "active") {
                    if (a1.classList) {
                        a1.classList.remove("active");
                        ul1.classList.remove("activeList");
                    }
                    else {
                        a1.className = a1.className.replace(/\bactive\b/g, "");       // For IE9 and earlier
                        ul1.className = ul1.className.replace(/\bactiveList\b/g, ""); // For IE9 and earlier
                    }
                }
                else if (a2.className == "active") {
                    if (a2.classList) {
                        a2.classList.remove("active");
                        ul2.classList.remove("activeList");
                    }
                    else {
                        a2.className = a2.className.replace(/\bactive\b/g, "");       // For IE9 and earlier
                        ul2.className = ul2.className.replace(/\bactiveList\b/g, ""); // For IE9 and earlier
                    }
                }
                else if (a3.className == "active") {
                    if (a3.classList) {
                        a3.classList.remove("active");
                        ul3.classList.remove("activeList");
                    }
                    else {
                        a3.className = a3.className.replace(/\bactive\b/g, "");       // For IE9 and earlier
                        ul3.className = ul3.className.replace(/\bactiveList\b/g, ""); // For IE9 and earlier
                    }
                }
                else if (a4.className == "active") {
                    if (a4.classList) {
                        a4.classList.remove("active");
                        ul4.classList.remove("activeList");
                    }
                    else {
                        a4.className = a4.className.replace(/\bactive\b/g, "");       // For IE9 and earlier
                        ul4.className = ul4.className.replace(/\bactiveList\b/g, ""); // For IE9 and earlier
                    }
                }
            }
        }
        function displayTextBox1(radioBtnId) {
            var radioBoxNumber = ~ ~(radioBtnId.substring(8));
            var remarkNumber = Math.ceil(radioBoxNumber / 4);
            var remarkID = "remark" + remarkNumber;
            var sameRowYesBtnId;
            
            if (radioBoxNumber % 2 == 1) {
                var sameRowYesOrNo = ((radioBoxNumber + 1) % 4) == 0;
                if (sameRowYesOrNo) {
                    sameRowYesBtnId = "radioBtn" + (radioBoxNumber - 2);
                }
                else {
                    sameRowYesBtnId = "radioBtn" + (radioBoxNumber + 2);
                }
            }
            else {
                var sameRowYesOrNo = (radioBoxNumber % 4) == 0;
                if (sameRowYesOrNo) {
                    radioBtnId = "radioBtn" + (radioBoxNumber - 3); // Change radioBtnId to yes button id
                    sameRowYesBtnId = "radioBtn" + (radioBoxNumber - 1);
                }
                else {
                    radioBtnId = "radioBtn" + (radioBoxNumber - 1); // Change radioBtnId to yes button id
                    sameRowYesBtnId = "radioBtn" + (radioBoxNumber + 1);
                }
            }
            if (document.getElementById(radioBtnId).checked || document.getElementById(sameRowYesBtnId).checked) {
                document.getElementById(remarkID).style.display = "block";
                document.getElementById(remarkID).focus();
            }
            else {
                document.getElementById(remarkID).style.display = "none";
                document.getElementById(remarkID).value = "";
                document.getElementById(remarkID).blur();
            }
        }
        function displayDateBox(dateBoxIdVal) {
            //var selectValue = dropDown.options[dropDown.selectedIndex].value;
            var selectValue = dateBoxIdVal.substr(dateBoxIdVal.length - 1);
            var dateBoxId = dateBoxIdVal.slice(0, -1);
            var from = dateBoxId + "From";
            var to = dateBoxId + "To";
            if (selectValue == "Y") {
                document.getElementById(from).style.display = "block";
                document.getElementById(to).style.display = "block";
            }
            else {
                document.getElementById(from).style.display = "none";
                document.getElementById(to).style.display = "none";
                document.getElementById(from).value = "";
                document.getElementById(to).value = "";
            }
        }
        function displayTextBox2(textBoxId) {
            var dropDown = document.getElementById(textBoxId);
            var selectValue = dropDown.options[dropDown.selectedIndex].value;
            textBoxId += "TextBox";
            if (selectValue == "Abnormal") {
                document.getElementById(textBoxId).style.display = "block";
                document.getElementById(textBoxId).focus();
            }
            else {
                document.getElementById(textBoxId).style.display = "none";
                document.getElementById(textBoxId).value = "";
                document.getElementById(textBoxId).blur();
            }
        }
        function responsiveTopNav() {
            var x = document.getElementById("myTopnav");
            if (x.className === "topnav") {
                x.className += " responsive";
            } else {
                x.className = "topnav";
            }
        }
        function closeDropDown() {
            var x = document.getElementById("myTopnav");
            if (!(x.className === "topnav")) {
                x.className = "topnav";
            }
        }
        /* #888888 = Gray */    /* #333333 = Black */
        /*
        function changeHandler1() {  
        if (document.getElementById("noProblem").checked) {
        document.getElementById("disease").style.display = "none";
        document.getElementById("suggestion").style.display = "none";
        document.getElementById("cboxDisease").checked = false;
        document.getElementById("cboxSuggestion").checked = false;
        document.getElementById("disease").blur();
        document.getElementById("disease").value = "";
        document.getElementById("suggestion").blur();
        document.getElementById("suggestion").value = "";
        document.getElementById("lblNoProblem").style.color = "#333333";
        document.getElementById("lblDisease").style.color = "#888888";
        document.getElementById("lblSuggestion").style.color = "#888888";
        }
        else {
        document.getElementById("lblDisease").style.color = "#333333";
        document.getElementById("lblSuggestion").style.color = "#333333";
        }
        }*/
        function changeHandler2() {
            if (document.getElementById("disease").style.display == "none") {
                document.getElementById("disease").style.display = "block";
                document.getElementById("disease").focus();
                //document.getElementById("noProblem").checked = false;
                //document.getElementById("cboxSuggestion").checked = false;
                //document.getElementById("lblNoProblem").style.color = "#888888";
                //document.getElementById("lblDisease").style.color = "#333333";
                //document.getElementById("lblSuggestion").style.color = "#888888";
            }
            else {
                document.getElementById("disease").style.display = "none";
                document.getElementById("disease").value = "";
                document.getElementById("disease").blur();
                //document.getElementById("lblNoProblem").style.color = "#333333";
                //document.getElementById("lblSuggestion").style.color = "#333333";
            }
            //document.getElementById("suggestion").style.display = "none";
            //document.getElementById("suggestion").value = "";
            //document.getElementById("suggestion").blur();
        }
        function changeHandler3() {
            if (document.getElementById("suggestion").style.display == "none") {
                document.getElementById("suggestion").style.display = "block";
                document.getElementById("suggestion").focus();
                //document.getElementById("noProblem").checked = false;
                //document.getElementById("cboxDisease").checked = false;
                //document.getElementById("lblNoProblem").style.color = "#888888";
                //document.getElementById("lblDisease").style.color = "#888888";
                //document.getElementById("lblSuggestion").style.color = "#333333";
            }
            else {
                document.getElementById("suggestion").style.display = "none";
                document.getElementById("suggestion").value = "";
                document.getElementById("suggestion").blur();
                //document.getElementById("lblNoProblem").style.color = "#333333";
                //document.getElementById("lblDisease").style.color = "#333333";
            }
            //document.getElementById("disease").style.display = "none";
            //document.getElementById("disease").value = "";
            //document.getElementById("disease").blur();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">

    <!-- div for search -->
    <div id="divTop" onclick="closeDropDown()">
        <section class="content-header">
            <h1 style="color:#DD4B39; font-weight: bold; padding-bottom:15px;">
                Routine Medical Examination
                <small>RME</small>
            </h1>
        </section>
        <!-- div for search keyword -->

        <%--<div id="divSearchKeyword" class="container-fluid">
            <div class="form-group">
                <div class="col-md-3">
                    <label for="category">Search By:</label>
                    <select class="form-control" id="category" name="category" runat="server">        
                        <option value="queueNumber" selected> Queue Number</option>
                        <option value="matrixNumber"> Matrix Number</option>
                        <option value="icNumber"> IC Number</option>
                        <option value="name"> Name</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label for="searchKey">Keyword:</label>
                    <div class="input-group stylish-input-group">
                        <asp:TextBox class="form-control" 
                        ID="searchKey" placeholder="Search" runat="server"></asp:TextBox>
                        <span class="input-group-addon">
                            <button id="searchButton">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </span>
                    </div>
                </div>
            </div>
        </div>--%>
        <%--<asp:Panel ID="Panel1" runat="server" Visible="False">
        
        <div id="divSearchResult">--%>
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
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="part1" HeaderText="General" SortExpression="part1" />
                            <asp:BoundField DataField="part2" HeaderText="Medical History" SortExpression="part2" />
                            <asp:BoundField DataField="part3" HeaderText="Body System" SortExpression="part3" />
                            <asp:BoundField DataField="part4" HeaderText="Lab" SortExpression="part4" />
                            <asp:BoundField DataField="Status" HeaderText="Verification" SortExpression="Status" />
                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#00A65A" Font-Bold="True" ForeColor="White" />
                        <PagerSettings mode="NumericFirstLast" position="Bottom" pagebuttoncount="10"/>
                        <PagerStyle HorizontalAlign="Center" CssClass="paging" ForeColor="White" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#00C0EF" ForeColor="Black" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        
                        SelectCommand="SELECT Name, part1, part2, part3, part4, Status FROM QueueList WHERE (StatusActive = 'Y') AND (Status = 0)" >
                    </asp:SqlDataSource>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
    </div>
       <%-- </div>
        <!-- end of divSearchResult -->
        </asp:Panel>--%>
    
    <!-- end of divTop -->
    
    <!-- div for patient's information ie bahagian 1,2,3,4 -->
    <asp:Panel ID="Panel2" runat="server" Visible="False">
        <div class="box box-info" onclick="closeDropDown()">
            <div class="box-header">
                <h3 class="box-title">Patient information</h3>
                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                </div>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [AccountNo], [DOB], [Name], [MatricNo], [PhoneNo2], [PhoneNo1], [RelativeName], [Nationality], [Course], [Faculty], [Semester], [Ic], [YearAcademic], [Status], [Age], [Gender], [Postcode], [RelativeAdd], [CityState] FROM [PatientInfo] WHERE (([Expr1] = 'Y') AND ([Expr2] = 'Y') AND ([Expr4] = 'Y') AND ([Expr5] = 'Y') AND ([Expr6] = 'Y') AND ([Name] = @Name))">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Y" Name="Expr1" Type="String" />
                        <asp:Parameter DefaultValue="Y" Name="Expr2" Type="String" />
                        <asp:Parameter DefaultValue="Y" Name="Expr4" Type="String" />
                        <asp:Parameter DefaultValue="Y" Name="Expr5" Type="String" />
                        <asp:Parameter DefaultValue="Y" Name="Expr6" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [Height], [Weight], [Pulse], [Eye_Test_OnGlass_Right], [BloodPressure], [Eye_Test_OnGlass_Left], [Eye_Test_NoGlass_Left], [Eye_Test_NoGlass_Right] FROM [General] WHERE (([AccountNo] = @AccountNo) AND ([Expr1] = @Expr1) AND ([StatusActive] = @StatusActive) AND ([Status] = @Status))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="accNumber" Name="AccountNo" 
                            PropertyName="Text" Type="Int64" />
                        <asp:Parameter DefaultValue="Y" Name="Expr1" Type="String" />
                        <asp:Parameter DefaultValue="Y" Name="StatusActive" Type="String" />
                        <asp:Parameter DefaultValue="0" Name="Status" Type="Byte" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <div class="box-body no-padding">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2" style="text-align:center;">
                    <img src="../images/avatar.png" style="margin-top:5px;" class="img-thumbnail" alt="Profile Image" width="130" height="150"/>
                </div>
                <div id="personal" class="col-xs-12 col-sm-8 col-md-10 col-lg-10" style="margin-top:10px;">
                    <div class="form-inline">
                        <div class="row" style="margin-bottom:10px;">
                            <div class="form-group col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                <label class="customLabel" for="faculty">Faculty&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                <asp:Label ID="faculty" class="form-control" runat="server" style="border:none;"></asp:Label>
                            </div>
                            <div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <label class="customLabel" for="courseCode">Course Code&nbsp;</label>
                                <asp:Label ID="courseCode" class="form-control" runat="server" style="border:none;"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-xs-12 col-sm-12 col-md-8 col-lg-8">
                                <label class="customLabel" for="name">Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                <asp:Label ID="name" class="form-control" runat="server" style="border:none;"></asp:Label>
                            </div>
                            <div class="form-group col-xs-6 col-sm-6 col-md-4 col-lg-4">
                                <label class="customLabel" for="mNumber">Matric No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                <asp:Label ID="mNumber" class="form-control" style="border:none;" runat="server"></asp:Label>
                            </div>
                            <div class="form-group col-xs-6 col-md-4 col-lg-4">
                                <label class="customLabel" for="citizenship">Citizenship&nbsp;&nbsp;&nbsp;</label>
                                <asp:Label ID="citizenship" class="form-control" runat="server" style="border:none;"></asp:Label>
                            </div>
                            <div class="form-group col-xs-6 col-md-4 col-lg-4">
                                <label class="customLabel" for="gender">Gender&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                <asp:Label ID="gender" class="form-control" runat="server" style="border:none;"></asp:Label>
                            </div>
                            <div class="form-group col-xs-6 col-md-4 col-lg-4">
                                <label class="customLabel" for="age">Age&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                <asp:Label ID="age" class="form-control" runat="server" style="border:none;"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin-top:10px;">
                    <div class="box collapsed-box box-info">
                        <div class="box-header with-border" data-widget="collapse">
                            <div class="box-tools pull-right" style="display:none;">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                </button>
                            </div>
                            <h3 class="box-title">More Information</span></h3>
                        </div>
                        <div class="box-body">
                            <div class="form-inline">
                                <div class="row" style="padding-top:10px;">
                                    <div class="form-group col-xs-6 col-sm-4 col-md-4 col-lg-4">
                                        <label class="customLabel" for="accNumber">Account</label>
                                        <asp:Label ID="accNumber" class="form-control" style="border:none;" runat="server"></asp:Label>
                                    </div>
                                    <div class="form-group col-xs-6 col-sm-4 col-md-4 col-lg-4">
                                        <label class="customLabel" for="acadYear">Year/Academic</label>
                                        <asp:Label ID="acadYear" class="form-control" runat="server" style="border:none;"></asp:Label>
                                    </div>
                                    <div class="form-group col-xs-6 col-sm-4 col-md-4 col-lg-4">
                                        <label class="customLabel" for="courseCode">Semester&nbsp;&nbsp;&nbsp;</label>
                                        <asp:Label ID="semester" class="form-control" runat="server" style="border:none;"></asp:Label>
                                    </div>
                                </div>
                                <div class="row" style="padding-top:10px;">
                                    <div class="form-group col-xs-6 col-sm-6 col-md-4 col-lg-4" >
                                        <label class="customLabel" for="icNumber">IC No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        <asp:Label ID="icNumber" class="form-control" runat="server" style="border:none;"></asp:Label>
                                    </div>
                                    <div class="form-group col-xs-6 col-sm-6 col-md-4 col-lg-4">
                                        <label class="customLabel" for="dob">Date of Birth&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        <asp:Label ID="dob" class="form-control" runat="server" style="border:none;"></asp:Label>
                                    </div>
                                    <div class="form-group col-xs-6 col-sm-6 col-md-4 col-lg-4">
                                        <label class="customLabel" for="status">Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        <asp:Label ID="status" class="form-control" runat="server" style="border:none;"></asp:Label>
                                    </div>
                                </div>              
                                <div class="row" style="padding-top:10px;">
                                    <div class="form-group col-xs-12">
                                        <label class="customLabel" for="gName">Guardian's Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        <asp:Label ID="gName" class="form-control" runat="server" style="border:none; "></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-xs-12" style="padding-top:10px;">
                                        <label class="customLabel" for="gAddress">Guardian's Address&nbsp;</label>
                                        <asp:Label ID="gAddress" class="form-control" runat="server" style="border:none;"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-xs-6" style="padding-top:10px;">
                                        <label class="customLabel" for="poscode">Postcode&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        <asp:Label ID="poscode" class="form-control" runat="server" style="border:none;"></asp:Label>
                                    </div>
                                    <div class="form-group col-xs-6" style="padding-top:10px;">
                                        <label class="customLabel" for="cityState">City/ State&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        <asp:Label ID="cityState" class="form-control" runat="server" style="border:none;"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-xs-6" style="padding-top:10px;">
                                        <label class="customLabel" for="resTelNo">Resident Tel No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        <asp:Label ID="resTelNo" class="form-control" runat="server" style="border:none;"></asp:Label>
                                    </div>
                                    <div class="form-group col-xs-6" style="padding-top:10px;">
                                        <label class="customLabel" for="offTelNo">Office Tel No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        <asp:Label ID="offTelNo" class="form-control" runat="server" style="border:none;"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <div id="divBot">
        <div id="divTopNav">
            <ul class="topnav" id="myTopnav">
                <li id="ulPartOne" class="activeList"><a id="numListOne" class="active" onclick="displaySelectedPart(this.id)">General</a></li>
                <li id="ulPartTwo"><a id="numListTwo" onclick="displaySelectedPart(this.id)">Medical History</a></li>
                <li id="ulPartThree"><a id="numListThree" onclick="displaySelectedPart(this.id)">Body System</a></li>
                <li id="ulPartFour"><a id="numListFour" onclick="displaySelectedPart(this.id)">Lab</a></li>
                <li id="ulPartFive"><a id="numListFive" onclick="displaySelectedPart(this.id)">Pengesahan</a></li>
                <li class="icon">
                    <a href="javascript:void(0);" style="font-size:16.5px;" onclick="responsiveTopNav()">☰</a>
                </li>
            </ul>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div id="contentRmePatient" class="container-fluid" style="margin-top:15px;" onclick="closeDropDown()">
            <div id="partOne" class="panel panel-default">    <!-- bahagian 1 -->
                <div class="panel-body">
                    <div class="form-inline" id="form1">
                        <h2 class="smallHeader">General Examination</h2>
                        <div class="row">
                            <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-3" style="padding-bottom:10px;">
                                <label class="customLabel" for="height">Height&nbsp;&nbsp;</label>
                                <asp:TextBox ID="height" class="form-control" clientidmode="static" aria-describedby="heightHelpInline" runat="server"></asp:TextBox>
                                <small id="heightHelpInline" class="text-muted">cm</small>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Numbers, Custom" TargetControlID="height" ValidChars="." />
                            </div>
                            <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-3" style="padding-bottom:10px;">
                                <label class="customLabel" for="weight">Weight&nbsp;&nbsp;</label>
                                <asp:TextBox ID="weight" class="form-control" clientidmode="static" aria-describedby="weightHelpInline" runat="server"></asp:TextBox>
                                <small id="weightHelpInline" class="text-muted">kg</small>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterType="Numbers, Custom" TargetControlID="weight" ValidChars="." />
                            </div>
                            <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-3">
                                <label class="customLabel" for="pulse">Pulse&nbsp;&nbsp;</label>
                                <asp:TextBox ID="pulse" class="form-control" clientidmode="static" aria-describedby="pulseHelpInline" runat="server"></asp:TextBox>
                                <small id="pulseHelpInline" class="text-muted">/min</small>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" FilterType="Numbers" TargetControlID="pulse" />
                            </div>
                            <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-3">
                                <label class="customLabel" for="bp1">BP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                <asp:TextBox ID="bp1" class="form-control" clientidmode="static" placeholder="DIA/SYS" aria-describedby="bpHelpInline" runat="server"></asp:TextBox>
                                <small id="bpHelpInline" class="text-muted">mmHg</small>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" FilterType="Numbers, Custom" TargetControlID="pulse" ValidChars="/" />
                            </div>
                        </div>
                        <h2 class="smallHeader" style="padding-bottom:0px; padding-top:30px;">Eye Examination</h2>
                        <table class="table" style="max-width:600px;">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th style="text-align: center; font-weight:500;">Right</th>
                                    <th style="text-align: center; font-weight:500;">Left</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <label class="customLabel" for="noSpecs1">Without spectacles</label>
                                    </td>
                                    <td style="text-align: center;">
                                        <asp:TextBox ID="noSpecs1" class="form-control" clientidmode="static" runat="server" aria-describedby="rightSpecHelpInline" placeholder="/6"></asp:TextBox>
                                        <small id="rightSpecHelpInline" class="text-muted">/6</small>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" FilterType="Numbers, Custom" TargetControlID="noSpecs1" ValidChars="." />
                                    </td>
                                    <td style="text-align: center;">
                                        <asp:TextBox ID="noSpecs2" class="form-control" clientidmode="static" runat="server" aria-describedby="leftSpecHelpInline" placeholder="/6"></asp:TextBox>
                                        <small id="leftSpecHelpInline" class="text-muted">/6</small>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" FilterType="Numbers, Custom" TargetControlID="noSpecs2" ValidChars="." />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="customLabel" for="withSpecs1">Without spectacles</label>
                                    </td>
                                    <td style="text-align: center;">
                                        <asp:TextBox ID="withSpecs1" class="form-control" clientidmode="static" runat="server" aria-describedby="rightWithSpecHelpInline" placeholder="/6"></asp:TextBox>
                                        <small id="rightWithSpecHelpInline" class="text-muted">/6</small>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" FilterType="Numbers, Custom" TargetControlID="withSpecs1" ValidChars="." />
                                    </td>
                                    <td style="text-align: center;">
                                        <asp:TextBox ID="withSpecs2" class="form-control" clientidmode="static" runat="server" aria-describedby="leftWithSpecHelpInline" placeholder="/6"></asp:TextBox>
                                        <small id="leftWithSpecHelpInline" class="text-muted">/6</small>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" FilterType="Numbers, Custom" TargetControlID="withSpecs2" ValidChars="." />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <input type="button" id="saveBtn1" clientidmode="static" class="form-control" value="Save" runat="server" onserverclick="saveBtn1_Click"/>
            </div>
            <div id="partTwo" runat="server" clientidmode="static" style="display:none;">    <!-- bahagian 2 -->
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title" style="font-size:160%; color:#DD4B39;">Self Illness and Family History</h3>
                        </div>
                        <div class="box-body no-padding">
                            <table class="table table-hover">
                                <thead class="thead-inverse" bgcolor="#00A65A" style="color:White;">
                                    <tr>
                                        <th rowspan="2">Problem</th>
                                        <th colspan="2" class="cell-center">Self</th>
                                        <th colspan="2" class="cell-center">Family</th>
                                        <th rowspan="2" class="cell-center">If 'Yes', please state</th>
                                    </tr>
                                    <tr>
                                        <th class="cell-center">Yes</th>
                                        <th class="cell-center">No</th>
                                        <th class="cell-center">Yes</th>
                                        <th class="cell-center">No</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th>Congenital or inherited disorder</th>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn1" GroupName="radioBtn1" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn1')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn2" GroupName="radioBtn1" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn2')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn3" GroupName="radioBtn2" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn3')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn4" GroupName="radioBtn2" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn4')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:TextBox class="form-control" id="remark1" name="remark1" runat="server" clientidmode="static" style="display:none;"/></td>
                                    </tr>
                                    <tr>
                                        <th>Allergy</th>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn5" GroupName="radioBtn3" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn5')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn6" GroupName="radioBtn3" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn6')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn7" GroupName="radioBtn4" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn7')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn8" GroupName="radioBtn4" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn8')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:TextBox class="form-control" id="remark2" name="remark2" runat="server" clientidmode="static" style="display:none;"/></td>
                                    </tr>
                                    <tr>
                                        <th>Mental Illness</th>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn9" GroupName="radioBtn5" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn9')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn10" GroupName="radioBtn5" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn10')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn11" GroupName="radioBtn6" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn11')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn12" GroupName="radioBtn6" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn12')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:TextBox class="form-control" id="remark3" name="remark3" runat="server" clientidmode="static" style="display:none;"/></td>
                                    </tr>
                                    <tr>
                                        <th>Fits, Stroke, other Neurological</th>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn13" GroupName="radioBtn7" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn13')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn14" GroupName="radioBtn7" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn14')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn15" GroupName="radioBtn8" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn15')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn16" GroupName="radioBtn8" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn16')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:TextBox class="form-control" id="remark4" name="remark4" runat="server" clientidmode="static" style="display:none;"/></td>
                                    </tr>
                                    <tr>
                                        <th>Diabetes</th>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn17" GroupName="radioBtn9" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn17')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn18" GroupName="radioBtn9" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn18')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn19" GroupName="radioBtn10" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn19')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn20" GroupName="radioBtn10" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn20')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:TextBox class="form-control" id="remark5" name="remark5" runat="server" clientidmode="static" style="display:none;"/></td>
                                    </tr>
                                    <tr>
                                        <th>Hypertension</th>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn21" GroupName="radioBtn11" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn21')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn22" GroupName="radioBtn11" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn22')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn23" GroupName="radioBtn12" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn23')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn24" GroupName="radioBtn12" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn24')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:TextBox class="form-control" id="remark6" name="remark6" runat="server" clientidmode="static" style="display:none;"/></td>
                                    </tr>
                                    <tr>
                                        <th>Heart or Vascular Disease</th>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn25" GroupName="radioBtn13" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn25')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn26" GroupName="radioBtn13" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn26')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn27" GroupName="radioBtn14" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn27')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn28" GroupName="radioBtn14" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn28')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:TextBox class="form-control" id="remark7" name="remark7" runat="server" clientidmode="static" style="display:none;"/></td>
                                    </tr>
                                    <tr>
                                        <th>Asthma</th>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn29" GroupName="radioBtn15" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn29')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn30" GroupName="radioBtn15" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn30')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn31" GroupName="radioBtn16" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn31')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn32" GroupName="radioBtn16" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn32')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:TextBox class="form-control" id="remark8" name="remark8" runat="server" clientidmode="static" style="display:none;"/></td>
                                    </tr>
                                    <tr>
                                        <th>Kidney Disease</th>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn33" GroupName="radioBtn17" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn33')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn34" GroupName="radioBtn17" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn34')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn35" GroupName="radioBtn18" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn35')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn36" GroupName="radioBtn18" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn36')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:TextBox class="form-control" id="remark9" name="remark9" runat="server" clientidmode="static" style="display:none;"/></td>
                                    </tr>
                                    <tr>
                                        <th>Cancer</th>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn37" GroupName="radioBtn19" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn37')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn38" GroupName="radioBtn19" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn38')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn39" GroupName="radioBtn20" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn39')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn40" GroupName="radioBtn20" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn40')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:TextBox class="form-control" id="remark10" name="remark10" runat="server" clientidmode="static" style="display:none;"/></td>
                                    </tr>
                                    <tr>
                                        <th>Tuberculosis</th>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn41" GroupName="radioBtn21" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn41')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn42" GroupName="radioBtn21" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn42')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn43" GroupName="radioBtn22" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn43')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn44" GroupName="radioBtn22" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn44')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:TextBox class="form-control" id="remark11" name="remark11" runat="server" clientidmode="static" style="display:none;"/></td>
                                    </tr>
                                    <tr>
                                        <th>Drug Addiction</th>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn45" GroupName="radioBtn23" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn45')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn46" GroupName="radioBtn23" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn46')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn47" GroupName="radioBtn24" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn47')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn48" GroupName="radioBtn24" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn48')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:TextBox class="form-control" id="remark12" name="remark12" runat="server" clientidmode="static" style="display:none;"/></td>
                                    </tr>
                                    <tr>
                                        <th>AIDS, HIV</th>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn49" GroupName="radioBtn25" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn49')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn50" GroupName="radioBtn25" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn50')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn51" GroupName="radioBtn26" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn51')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn52" GroupName="radioBtn26" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn52')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:TextBox class="form-control" id="remark13" name="remark13" runat="server" clientidmode="static" style="display:none;"/></td>
                                    </tr>
                                    <tr>
                                        <th>History of Surgery</th>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn53" GroupName="radioBtn27" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn53')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn54" GroupName="radioBtn27" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn54')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn55" GroupName="radioBtn28" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn55')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn56" GroupName="radioBtn28" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn56')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:TextBox class="form-control" id="remark14" name="remark14" runat="server" clientidmode="static" style="display:none;"/></td>
                                    </tr>
                                    <tr>
                                        <th>Other serious illnesses</th>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn57" GroupName="radioBtn29" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn57')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn58" GroupName="radioBtn29" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn58')" value="no" Checked="True" /></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn59" GroupName="radioBtn30" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn59')" value="yes"/></td>
                                        <td class="cell-center"><asp:RadioButton id="radioBtn60" GroupName="radioBtn30" runat="server" clientidmode="static" onchange="displayTextBox1('radioBtn60')" value="no" Checked="True"/></td>
                                        <td class="cell-center"><asp:TextBox class="form-control" id="remark15" name="remark15" runat="server" clientidmode="static" style="display:none;"/></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="box" style="margin-top:20px;">
                        <div class="box-header">
                            <h3 class="box-title" style="font-size:160%; color:#DD4B39;">Immunization History</h3>
                        </div>
                        <div class="box-body no-padding">
                            <table class="table table-hover">
                                <thead class="thead-inverse" bgcolor="#3C8DBC" style="color:White;">
                                    <tr>
                                        <th rowspan="2">Vaccines</th>
                                        <th rowspan="2" class="cell-center">'Yes' for Have, 'No' for Never</th>
                                        <th colspan="2" class="cell-center">Duration</th>
                                    </tr>
                                    <tr>
                                        <th class="cell-center">From</th>
                                        <th class="cell-center">Until</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th>Yellow Fever</th>
                                        <td class="cell-center">
                                            <div class="col-xs-6"><label><asp:RadioButton id="yellowFeverY" GroupName="yellowFever" value="yes" runat="server" clientidmode="static" onchange="displayDateBox('yellowFeverY')" style="margin-right:5px;" />Yes</label></div>
                                            <div class="col-xs-6"><label><asp:RadioButton id="yellowFeverN" GroupName="yellowFever" value="no" runat="server" clientidmode="static" onchange="displayDateBox('yellowFeverN')" style="margin-right:5px;" checked />No</label></div>
                                        </td>
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="yellowFeverFrom" Format="dd/MM/yyyy" TodaysDateFormat="d MMMM, yyyy" />
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="yellowFeverTo" Format="dd/MM/yyyy" TodaysDateFormat="d MMMM, yyyy" />
                                        <td class="cell-center">
                                            <asp:TextBox ID="yellowFeverFrom" class="form-control" clientidmode="static" runat="server" placeholder="dd/mm/yyyy" style="display:none;"></asp:TextBox>
                                        </td>
                                        <td class="cell-center">
                                            <asp:TextBox ID="yellowFeverTo" class="form-control" clientidmode="static" runat="server" placeholder="dd/mm/yyyy" style="display:none;"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>BCG</th>
                                        <td class="cell-center">
                                            <div class="col-xs-6"><label><asp:RadioButton id="bcgY" GroupName="bcg" class="flat-red" value="yes" runat="server" clientidmode="static" onchange="displayDateBox('bcgY')" style="margin-right:5px;" />Yes</label></div>
                                            <div class="col-xs-6"><label><asp:RadioButton id="bcgN" GroupName="bcg" class="flat-red" value="no" runat="server" clientidmode="static" onchange="displayDateBox('bcgN')" style="margin-right:5px;" checked />No</label></div>
                                        </td>
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="bcgFrom" Format="dd/MM/yyyy" TodaysDateFormat="d MMMM, yyyy" />
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="bcgTo" Format="dd/MM/yyyy" TodaysDateFormat="d MMMM, yyyy" />
                                        <td class="cell-center">
                                            <asp:TextBox ID="bcgFrom" class="form-control" clientidmode="static" runat="server" placeholder="dd/mm/yyyy" style="display:none;"></asp:TextBox>
                                        </td>
                                        <td class="cell-center">
                                            <asp:TextBox ID="bcgTo" class="form-control" clientidmode="static" runat="server" placeholder="dd/mm/yyyy" style="display:none;"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Typhoid</th>
                                        <td class="cell-center">
                                            <div class="col-xs-6"><label><asp:RadioButton id="typhoidY" GroupName="typhoid" value="yes" runat="server" clientidmode="static" onchange="displayDateBox('typhoidY')" style="margin-right:5px;" />Yes</label></div>
                                            <div class="col-xs-6"><label><asp:RadioButton id="typhoidN" GroupName="typhoid" value="no" runat="server" clientidmode="static" onchange="displayDateBox('typhoidN')" style="margin-right:5px;" checked />No</label></div>
                                        </td>
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="typhoidFrom" Format="dd/MM/yyyy" TodaysDateFormat="d MMMM, yyyy" />
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender6" runat="server" TargetControlID="typhoidTo" Format="dd/MM/yyyy" TodaysDateFormat="d MMMM, yyyy" />
                                        <td class="cell-center">
                                            <asp:TextBox ID="typhoidFrom" class="form-control" clientidmode="static" runat="server" placeholder="dd/mm/yyyy" style="display:none;"></asp:TextBox>
                                        </td>
                                        <td class="cell-center">
                                            <asp:TextBox ID="typhoidTo" class="form-control" clientidmode="static" runat="server" placeholder="dd/mm/yyyy" style="display:none;"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Meningtis</th>
                                        <td class="cell-center">
                                            <div class="col-xs-6"><label><asp:RadioButton id="meningtisY" GroupName="meningtis" value="yes" runat="server" clientidmode="static" onchange="displayDateBox('meningtisY')" style="margin-right:5px;" />Yes</label></div>
                                            <div class="col-xs-6"><label><asp:RadioButton id="meningtisN" GroupName="meningtis" value="no" runat="server" clientidmode="static" onchange="displayDateBox('meningtisN')" style="margin-right:5px;" checked />No</label></div>
                                        </td>
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender7" runat="server" TargetControlID="meningtisFrom" Format="dd/MM/yyyy" TodaysDateFormat="d MMMM, yyyy" />
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender8" runat="server" TargetControlID="meningtisTo" Format="dd/MM/yyyy" TodaysDateFormat="d MMMM, yyyy" />
                                        <td class="cell-center">
                                            <asp:TextBox ID="meningtisFrom" class="form-control" clientidmode="static" runat="server" placeholder="dd/mm/yyyy" style="display:none;"></asp:TextBox>
                                        </td>
                                        <td class="cell-center">
                                            <asp:TextBox ID="meningtisTo" class="form-control" clientidmode="static" runat="server" placeholder="dd/mm/yyyy" style="display:none;"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Hepatitis B</th>
                                        <td class="cell-center">
                                            <div class="col-xs-6"><label><asp:RadioButton id="hepBY" GroupName="hepB" value="yes" runat="server" clientidmode="static" onchange="displayDateBox('hepBY')" style="margin-right:5px;" />Yes</label></div>
                                            <div class="col-xs-6"><label><asp:RadioButton id="hepBN" GroupName="hepB" value="no" runat="server" clientidmode="static" onchange="displayDateBox('hepBN')" style="margin-right:5px;" checked />No</label></div>
                                        </td>
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender9" runat="server" TargetControlID="hepBFrom" Format="dd/MM/yyyy" TodaysDateFormat="d MMMM, yyyy" />
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender10" runat="server" TargetControlID="hepBTo" Format="dd/MM/yyyy" TodaysDateFormat="d MMMM, yyyy" />
                                        <td class="cell-center">
                                            <asp:TextBox ID="hepBFrom" class="form-control" clientidmode="static" runat="server" placeholder="dd/mm/yyyy" style="display:none;"></asp:TextBox>
                                        </td>
                                        <td class="cell-center">
                                            <asp:TextBox ID="hepBTo" class="form-control" clientidmode="static" runat="server" placeholder="dd/mm/yyyy" style="display:none;"></asp:TextBox>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <input type="button" id="saveBtn2" clientidmode="static" class="form-control" value="Save" runat="server" onserverclick="saveBtn2_Click"/>
            </div>
            <div id="partThree" runat="server" clientidmode="static" style="display:none;">  <!-- bahagian 3 -->
                <div class="form-inline">
                    <div class="row">
                        <div class="form-group col-xs-4">
                            <label class="customLabel" for="pallor">Pallor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <asp:DropDownList ID="pallor" class="form-control" runat="server">
                                <asp:ListItem Value="-" Selected="True">Negative</asp:ListItem>
                                <asp:ListItem Value="+">Positive</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-xs-4">
                            <label class="customLabel" for="cyanosis">Cyanosis&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <asp:DropDownList ID="cyanosis" class="form-control" runat="server">
                                <asp:ListItem Value="-" Selected="True">Negative</asp:ListItem>
                                <asp:ListItem Value="+">Positive</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-xs-4">
                            <label class="customLabel" for="edema">Edema&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <asp:DropDownList ID="edema" class="form-control" runat="server">
                                <asp:ListItem Value="-" Selected="True">Negative</asp:ListItem>
                                <asp:ListItem Value="+">Positive</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="row" style="padding-top:25px">
                        <div class="form-group col-xs-4">
                            <label class="customLabel" for="jaundice">Jaundice&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <asp:DropDownList ID="jaundice" class="form-control" runat="server">
                                <asp:ListItem Value="-" Selected="True">Negative</asp:ListItem>
                                <asp:ListItem Value="+">Positive</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-xs-4">
                            <label class="customLabel" for="lymphNodes">Lymph Nodes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <asp:DropDownList ID="lymphNodes" class="form-control" runat="server">
                                <asp:ListItem Value="-" Selected="True">Negative</asp:ListItem>
                                <asp:ListItem Value="+">Positive</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-xs-4">
                            <label class="customLabel" for="skinChronic">Skin Chronic&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <asp:DropDownList ID="skinChronic" class="form-control" runat="server">
                                <asp:ListItem Value="-" Selected="True">Negative</asp:ListItem>
                                <asp:ListItem Value="+">Positive</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-inline">
                        <label class="customLabel" for="funduscopy">Funduscopy&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <div class="form-group">
                             <asp:DropDownList ID="funduscopy" class="form-control" runat="server" clientidmode="static" onchange="displayTextBox2('funduscopy')">
                                <asp:ListItem Value="Normal" Selected="True">Normal</asp:ListItem>
                                <asp:ListItem Value="Abnormal">Abnormal</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <label class="sr-only" for="funduscopyTextBox">Remark</label>
                        <div class="form-group">
                            <asp:TextBox class="form-control" id="funduscopyTextBox" runat="server" clientidmode="static" placeholder="Remark" style="min-width:240px; display:none;"/>
                        </div>
                    </div>

                    <div class="form-inline">
                        <label class="customLabel" for="colorBlind">Color Blind&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <div class="form-group">
                            <asp:DropDownList ID="colorBlind" class="form-control" runat="server" clientidmode="static" onchange="displayTextBox2('colorBlind')">
                                <asp:ListItem Value="Normal" Selected="True">Normal</asp:ListItem>
                                <asp:ListItem Value="Abnormal">Abnormal</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <label class="sr-only" for="colorBlindTextBox">Remark</label>
                        <div class="form-group">
                            <asp:TextBox class="form-control" id="colorBlindTextBox" runat="server" clientidmode="static" placeholder="Remark" style="min-width:240px; display:none;"/>
                        </div>
                    </div>

                    <div class="form-inline">
                        <label class="customLabel" for="ear">Ear&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <div class="form-group">
                            <asp:DropDownList ID="ear" class="form-control" runat="server" clientidmode="static" onchange="displayTextBox2('ear')">
                                <asp:ListItem Value="Normal" Selected="True">Normal</asp:ListItem>
                                <asp:ListItem Value="Abnormal">Abnormal</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <label class="sr-only" for="earTextBox">Remark</label>
                        <div class="form-group">
                            <asp:TextBox class="form-control" id="earTextBox" runat="server" clientidmode="static" placeholder="Remark" style="min-width:240px; display:none;"/>
                        </div>
                    </div>

                    <div class="form-inline">
                        <label class="customLabel" for="mouthTeeth">Mouth and Teeth&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <div class="form-group">
                            <asp:DropDownList ID="mouthTeeth" class="form-control" runat="server" clientidmode="static" onchange="displayTextBox2('mouthTeeth')">
                                <asp:ListItem Value="Normal" Selected="True">Normal</asp:ListItem>
                                <asp:ListItem Value="Abnormal">Abnormal</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <label class="sr-only" for="mouthTeethTextBox">Remark</label>
                        <div class="form-group">
                            <asp:TextBox class="form-control" id="mouthTeethTextBox" runat="server" clientidmode="static" placeholder="Remark" style="min-width:240px; display:none;"/>
                        </div>
                    </div>
 
                    <div class="form-inline">
                        <label class="customLabel" for="respSystem">Respiratory System&nbsp;&nbsp;</label>
                        <div class="form-group">
                            <asp:DropDownList ID="respSystem" class="form-control" runat="server" clientidmode="static" onchange="displayTextBox2('respSystem')">
                                <asp:ListItem Value="Normal" Selected="True">Normal</asp:ListItem>
                                <asp:ListItem Value="Abnormal">Abnormal</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <label class="sr-only" for="respSystemTextBox">Remark</label>
                        <div class="form-group">
                            <asp:TextBox class="form-control" id="respSystemTextBox" runat="server" clientidmode="static" placeholder="Remark" style="min-width:240px; display:none;"/>
                        </div>
                    </div>

                    <div class="form-inline">
                        <label class="customLabel" for="chestXRay">Chest X-Ray&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <div class="form-group">
                            <asp:DropDownList ID="chestXRay" class="form-control" runat="server" clientidmode="static" onchange="displayTextBox2('chestXRay')">
                                <asp:ListItem Value="Normal" Selected="True">Normal</asp:ListItem>
                                <asp:ListItem Value="Abnormal">Abnormal</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <label class="sr-only" for="chestXRayTextBox">Remark</label>
                        <div class="form-group">
                            <asp:TextBox class="form-control" id="chestXRayTextBox" runat="server" clientidmode="static" placeholder="Remark" style="min-width:240px; display:none;"/>
                        </div>
                        <div class="form-group">
                            <button type="button" class="btn btn-block btn-primary">X-Ray Image</button>
                            <asp:TextBox ID="xray" runat="server" Visible="False"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-inline">
                        <label class="customLabel" for="abdomenCavity">Abdomen Cavity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <div class="form-group">
                            <asp:DropDownList ID="abdomenCavity" class="form-control" runat="server" clientidmode="static" onchange="displayTextBox2('abdomenCavity')">
                                <asp:ListItem Value="Normal" Selected="True">Normal</asp:ListItem>
                                <asp:ListItem Value="Abnormal">Abnormal</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <label class="sr-only" for="abdomenCavityTextBox">Remark</label>
                        <div class="form-group">
                            <asp:TextBox class="form-control" id="abdomenCavityTextBox" runat="server" clientidmode="static" placeholder="Remark" style="min-width:240px; display:none;"/>
                        </div>
                    </div>

                    <div class="form-inline">
                        <label class="customLabel" for="nervesMental">Nerves and Mental&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <div class="form-group">
                            <asp:DropDownList ID="nervesMental" class="form-control" runat="server" clientidmode="static" onchange="displayTextBox2('nervesMental')">
                                <asp:ListItem Value="Normal" Selected="True">Normal</asp:ListItem>
                                <asp:ListItem Value="Abnormal">Abnormal</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <label class="sr-only" for="nervesMentalTextBox">Remark</label>
                        <div class="form-group">
                            <asp:TextBox class="form-control" id="nervesMentalTextBox" runat="server" clientidmode="static" placeholder="Remark" style="min-width:240px; display:none;"/>
                        </div>
                    </div>

                    <div class="form-inline">
                        <label class="customLabel" for="muscularSys">Muscular System&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <div class="form-group">
                            <asp:DropDownList ID="muscularSys" class="form-control" runat="server" clientidmode="static" onchange="displayTextBox2('muscularSys')">
                                <asp:ListItem Value="Normal" Selected="True">Normal</asp:ListItem>
                                <asp:ListItem Value="Abnormal">Abnormal</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <label class="sr-only" for="muscularSysTextBox">Remark</label>
                        <div class="form-group">
                            <asp:TextBox class="form-control" id="muscularSysTextBox" runat="server" clientidmode="static" placeholder="Remark" style="min-width:240px; display:none;"/>
                        </div>
                    </div>

                    <div class="form-inline">
                        <label class="customLabel" for="others">Others&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <label class="sr-only" for="othersTextBox">Remark</label>
                        <div class="form-group">
                            <asp:TextBox class="form-control" id="othersTextBox" runat="server" clientidmode="static" placeholder="Others" style="min-width:240px;"/>
                        </div>
                    </div>
                </div>
                <input type="button" id="saveBtn3" clientidmode="static" class="form-control" value="Save" style="margin-top:15px;" runat="server" onserverclick="saveBtn3_Click"/>
            </div>
            <div id="partFour" runat="server" clientidmode="static" style="display:none;">   <!-- bahagian 4 -->
                <div id="contentLab" class="panel panel-default" style="padding-top:none;">
                    <div class="panel-body">
                        <!-- Urine Testing(For local students) -->
                        <div class="form-inline" id="form4">
                            <h2 class="smallHeader">Urine Testing</h2>
                            <div class="row" style="padding-bottom:20px;">
                                <div class="form-group col-xs-6">
                                    <label class="customLabel" for="sugar">Sugar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                    <asp:DropDownList ID="sugar" class="form-control" runat="server">
                                        <asp:ListItem Value="-" Selected="True">Negative -</asp:ListItem>
                                        <asp:ListItem Value="+">+</asp:ListItem>
                                        <asp:ListItem Value="++">++</asp:ListItem>
                                        <asp:ListItem Value="+++">+++</asp:ListItem>
                                        <asp:ListItem Value="++++">++++</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group col-xs-6">
                                    <label class="customLabel" for="albumin">Albumin&nbsp;</label>
                                    <asp:DropDownList ID="albumin" class="form-control" runat="server">
                                        <asp:ListItem Value="-" Selected="True">Negative -</asp:ListItem>
                                        <asp:ListItem Value="T">Trace</asp:ListItem>
                                        <asp:ListItem Value="+">+</asp:ListItem>
                                        <asp:ListItem Value="++">++</asp:ListItem>
                                        <asp:ListItem Value="+++">+++</asp:ListItem>
                                        <asp:ListItem Value="++++">++++</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <!-- Microscopic(For local students) -->
                            <h2 class="smallHeader">Microscopic</h2>
                            <div class="row">
                                <div class="form-group col-xs-6">
                                    <label class="customLabel" for="rbc">Rbc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                    <asp:TextBox ID="rbc" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group col-xs-6">
                                    <label class="customLabel" for="pusCell">Pus Cell&nbsp;&nbsp;</label>
                                    <asp:TextBox ID="pusCell" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row" style="padding-bottom:20px;">
                                <div class="form-group col-xs-6 moreRowSameCategory">
                                    <label class="customLabel" for="cast">Cast&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                    <asp:DropDownList ID="cast" class="form-control" runat="server">
                                        <asp:ListItem Value="-" Selected="True">Negative -</asp:ListItem>
                                        <asp:ListItem Value="+">+</asp:ListItem>
                                        <asp:ListItem Value="++">++</asp:ListItem>
                                        <asp:ListItem Value="+++">+++</asp:ListItem>
                                        <asp:ListItem Value="++++">++++</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group col-xs-6 moreRowSameCategory">
                                    <label class="customLabel" for="crystal">Crystal&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                    <%--<select class="form-control" id="crystal" runat="server">
                                        <option value="-">Negative -</option>
                                        <option value="T">Trace</option>
                                        <option value="+">+</option>
                                        <option value="++">++</option>
                                        <option value="+++">+++</option>
                                        <option value="++++">++++</option>
                                    </select>--%>
                                    <asp:DropDownList ID="crystal" class="form-control" runat="server">
                                        <asp:ListItem Value="-" Selected="True">Negative -</asp:ListItem>
                                        <asp:ListItem Value="T">Trace</asp:ListItem>
                                        <asp:ListItem Value="+">+</asp:ListItem>
                                        <asp:ListItem Value="++">++</asp:ListItem>
                                        <asp:ListItem Value="+++">+++</asp:ListItem>
                                        <asp:ListItem Value="++++">++++</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <!-- This panel is only for international students -->
                            <asp:Panel ID="nonMalaysian" runat="server" style="display:none;">
                                <!-- Drug(For international students) -->
                                <h2 class="smallHeader">Drug</h2>
                                <div class="row" style="padding-bottom:20px;">
                                    <div class="form-group col-xs-6 col-sm-6 col-md-2 col-lg-2" style="padding-bottom:8px;">
                                        <label class="customLabel" for="opiate">Opiate&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        <asp:DropDownList ID="opiate" class="form-control" runat="server">
                                            <asp:ListItem Value="-" Selected="True">Negative -</asp:ListItem>
                                            <asp:ListItem Value="+">Positive +</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group col-xs-6 col-sm-6 col-md-2 col-lg-2" style="padding-bottom:8px;">
                                        <label class="customLabel" for="cannabis">Cannabis&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        <asp:DropDownList ID="cannabis" class="form-control" runat="server">
                                            <asp:ListItem Value="-" Selected="True">Negative -</asp:ListItem>
                                            <asp:ListItem Value="+">Positive +</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group col-xs-6 col-sm-6 col-md-3 col-lg-3" style="padding-bottom:8px;">
                                        <label class="customLabel" for="metH">Met. Hetamines&nbsp;</label>
                                        <asp:DropDownList ID="metH" class="form-control" runat="server">
                                            <asp:ListItem Value="-" Selected="True">Negative -</asp:ListItem>
                                            <asp:ListItem Value="+">Positive +</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group col-xs-6 col-sm-6 col-md-2 col-lg-2" style="padding-bottom:8px;">
                                        <label class="customLabel" for="ketamine">Ketamine&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        <asp:DropDownList ID="ketamine" class="form-control" runat="server">
                                            <asp:ListItem Value="-" Selected="True">Negative -</asp:ListItem>
                                            <asp:ListItem Value="+">Positive +</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group col-xs-6 col-sm-6 col-md-2 col-lg-2">
                                        <label class="customLabel" for="amp">Amphetamines&nbsp;&nbsp;</label>
                                        <asp:DropDownList ID="amp" class="form-control" runat="server">
                                            <asp:ListItem Value="-" Selected="True">Negative -</asp:ListItem>
                                            <asp:ListItem Value="+">Positive +</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <!-- Blood Test(For international students) -->
                                <h2 class="smallHeader">Blood Testing</h2>
                                <div class="row">
                                    <div class="form-group col-xs-6">
                                        <label class="customLabel" for="malaParasite">Malaria Parasite&nbsp;&nbsp;</label>
                                        <%--<select class="form-control" id="malaParasite" runat="server">
                                            <option value="-">Negative -</option>
                                            <option value="+">Positive +</option>
                                        </select>--%>
                                        <asp:DropDownList ID="malaParasite" class="form-control" runat="server">
                                            <asp:ListItem Value="-" Selected="True">Negative -</asp:ListItem>
                                            <asp:ListItem Value="+">Positive +</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group col-xs-6">
                                        <label class="customLabel" for="vdrl">VDRL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        <%--<select class="form-control" id="vdrl" runat="server">
                                            <option value="NR">Non-Reactive</option>
                                            <option value="R">Reactive</option>
                                        </select>--%>
                                        <asp:DropDownList ID="vdrl" class="form-control" runat="server">
                                            <asp:ListItem Value="NR" Selected="True">Non-Reactive</asp:ListItem>
                                            <asp:ListItem Value="R">Reactive</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-xs-6 moreRowSameCategory">
                                        <label class="customLabel" for="hepBAg">Hepatitis B Ag&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        <%--<select class="form-control" id="hepBAg" runat="server">
                                            <option value="-">Negative -</option>
                                            <option value="+">Positive +</option>
                                        </select>--%>
                                        <asp:DropDownList ID="hepBAg" class="form-control" runat="server">
                                            <asp:ListItem Value="-" Selected="True">Negative -</asp:ListItem>
                                            <asp:ListItem Value="+">Positive +</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group col-xs-6 moreRowSameCategory">
                                        <label class="customLabel" for="hepBAb">Hepatitis B Ab&nbsp;&nbsp;&nbsp;</label>
                                        <asp:TextBox ID="hepBAb" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-xs-6 moreRowSameCategory">
                                        <label class="customLabel" for="hepC">Hepatitis C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        <%--<select class="form-control" id="hepC" runat="server">
                                            <option value="NR">Non-Reactive</option>
                                            <option value="R">Reactive</option>
                                        </select>--%>
                                        <asp:DropDownList ID="hepC" class="form-control" runat="server">
                                            <asp:ListItem Value="NR" Selected="True">Non-Reactive</asp:ListItem>
                                            <asp:ListItem Value="R">Reactive</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group col-xs-6 moreRowSameCategory">
                                        <label class="customLabel" for="hiv">HIV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        <%--<select class="form-control" id="hiv" runat="server">
                                            <option value="-">Negative -</option>
                                            <option value="+">Positive +</option>
                                        </select>--%>
                                        <asp:DropDownList ID="hiv" class="form-control" runat="server">
                                            <asp:ListItem Value="-" Selected="True">Negative -</asp:ListItem>
                                            <asp:ListItem Value="+">Positive +</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                        <input type="button" id="saveBtn4" clientidmode="static" class="form-control" value="Save" style="margin-top:20px;" runat="server" onserverclick="saveBtn4_Click"/>
                    </div>
                </div>
            </div>
            <div id="partFive" runat="server" clientidmode="static" style="display:none;">
                <div id="contentDoctorConsent">
                    <div class="panel panel-default" style="padding-bottom:0px;">
                        <div class="panel-body">
                            <div id="doctorForm">
                                <fieldset>
                                    <legend id="doctorLegend">Doctor Verification</legend>
                                    Saya mengesahkan bahawa pada <asp:Label ID="VerifyDate" runat="server" Text=""></asp:Label> saya telah memeriksa <span class="nameIC"><%=name.Text%></span>
                                     No Kp <span class="nameIC" ><%=icNumber.Text%></span> dan mendapati bahawa        
                                    <div class="checkbox">
                                        <label id="lblNoProblem"><asp:CheckBox class="checkbox" id="noProblem" value="0" runat="server" clientidmode="static"/>Beliau tidak menghadapi apa-apa penyakit dan disahkan sihat.</label>
                                    </div>
                                    <div class="checkbox">
                                        <label id="lblDisease"><asp:CheckBox class="checkbox" id="cboxDisease" value="1" runat="server" clientidmode="static" onchange="changeHandler2()"/>Beliau menghadapi </label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:TextBox runat="server" ClientIDMode="static" class="form-control" id="disease" style="display:none;"/></div>
                                    <div class="checkbox">
                                        <label id="lblSuggestion"><asp:CheckBox class="checkbox" id="cboxSuggestion" value="2" runat="server" clientidmode="static" onchange="changeHandler3()"/>Beliau dicadangkan mendapatkan rawatan </label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:TextBox runat="server" ClientIDMode="static" class="form-control" id="suggestion" style="display:none;"/></div>
                                </fieldset>
                                <div id="centerDiv">
                                    <input type="button" id="saveBtn5" clientidmode="static" class="form-control" value="Save" runat="server" onserverclick="saveBtn5_Click"/>
                                    <input type="button" id="submitBtn" clientidmode="static" class="form-control" value="Submit" runat="server" onserverclick="submitBtn_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end of div for patient's information -->
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>