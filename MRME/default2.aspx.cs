using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Numerics;

public partial class MRME_default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showAndHideTextBoxPart2();
        showAndHideTextBoxPart3();
        showAndHideTextBoxPart5();
        string str = category.Value;

        if (string.IsNullOrWhiteSpace(searchKey.Text))
        {
            Panel1.Visible = false;
        }
        else
        {
            Panel1.Visible = true;

            if (str == "matrixNumber")
            {
                SqlDataSource1.SelectCommand = "SELECT [Name], [QueueNo], [MatricNo], [Ic] FROM [searchList]"
                                            + " WHERE ( ([MatricNo] LIKE '%' + @searchTerm + '%') AND (Status = 0) AND "
                                            + "(StatusActive = 'Y') AND (Expr1 = 'Y') AND (Expr2 = 'Y') AND (Expr3 = 'Y') "
                                            + "AND (Expr4 = 'Y') AND (Expr5 = 'Y') )";
            }
            else if (str == "icNumber")
            {
                SqlDataSource1.SelectCommand = "SELECT [Name], [QueueNo], [MatricNo], [Ic] FROM [searchList]"
                                            + " WHERE ( ([ic] LIKE '%' + @searchTerm + '%') AND (Status = 0) AND "
                                            + "(StatusActive = 'Y') AND (Expr1 = 'Y') AND (Expr2 = 'Y') AND (Expr3 = 'Y') "
                                            + "AND (Expr4 = 'Y') AND (Expr5 = 'Y') )";
            }
            else
            {
                SqlDataSource1.SelectCommand = "SELECT [Name], [QueueNo], [MatricNo], [Ic] FROM [searchList]"
                                            + " WHERE ( ([Name] LIKE '%' + @searchTerm + '%') AND (Status = 0) AND "
                                            + "(StatusActive = 'Y') AND (Expr1 = 'Y') AND (Expr2 = 'Y') AND (Expr3 = 'Y') "
                                            + "AND (Expr4 = 'Y') AND (Expr5 = 'Y') )";
            }
            SqlDataSource1.DataBind();
            GridView1.DataBind();
            //AddHeaders();
        }
    }
    /*
    protected void AddHeaders()
    {
        if (GridView1.Rows.Count > 0)
        {
            //This replaces <td> with <th>    
            GridView1.UseAccessibleHeader = true;
            //This will add the <thead> and <tbody> elements    
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            //This adds the <tfoot> element. Remove if you don't have a footer row    
            GridView1.FooterRow.TableSection = TableRowSection.TableFooter;
        }
    }  */
    //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        for (int i = 2; i < 7; i++)
    //        {
    //            Label newBtn = new Label();
    //            if (e.Row.Cells[i].Text == "0")
    //            {
    //                newBtn.Text = "NOT DONE";
    //                newBtn.ControlStyle.CssClass = "label label-danger";
    //                e.Row.Cells[i].Controls.Add(newBtn);
    //            }
    //            else
    //            {
    //                newBtn.Text = "DONE";
    //                newBtn.ControlStyle.CssClass = "label label-success";
    //                e.Row.Cells[i].Controls.Add(newBtn);
    //            }
    //        }
    //    }
    //}
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (GridView1.SelectedIndex != -1)
        {
            VerifyDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            Panel2.Visible = true;

            using (SqlConnection myConnection = new SqlConnection(GetConnectionString()))
            {
                myConnection.Open();
                SqlCommand cmd = new SqlCommand(null, myConnection);

                // Create and prepare an SQL statement.
                cmd.CommandText = "SELECT [AccountNo], [DOB], [Name], [MatricNo], [PhoneNo2], [PhoneNo1], [RelativeName], "
                                + "[Nationality], [Course], [Faculty], [Semester], [Ic], [YearAcademic], [Status], [Age], "
                                + "[Gender], [Postcode], [RelativeAdd], [CityState] FROM [PatientInfo] "
                                + "WHERE (([Expr1] = 'Y') AND ([Expr2] = 'Y') AND ([Expr4] = 'Y') AND ([Expr5] = 'Y') AND ([Expr6] = 'Y') AND ([Name] = @Name))";
                SqlParameter nameParam = new SqlParameter("@Name", SqlDbType.VarChar, 1000); // The data type of name in database is nvarchar(200)
                nameParam.Value = GridView1.SelectedRow.Cells[1].Text; // The cells index is 1 because the select button is in the 2nd column
                cmd.Parameters.Add(nameParam);

                // Call Prepare after setting the Commandtext and Parameters.
                cmd.Prepare();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        accNumber.Text = reader["AccountNo"].ToString();
                        mNumber.Text = reader["MatricNo"].ToString();
                        icNumber.Text = reader["Ic"].ToString();
                        acadYear.Text = reader["YearAcademic"].ToString();
                        semester.Text = reader["Semester"].ToString();
                        faculty.Text = reader["Faculty"].ToString();
                        courseCode.Text = reader["Course"].ToString();
                        name.Text = reader["Name"].ToString();
                        citizenship.Text = reader["Nationality"].ToString();
                        age.Text = reader["Age"].ToString();
                        gender.Text = reader["Gender"].ToString();
                        DateTime dtTemp;
                        DateTime.TryParse(reader["DOB"].ToString(), out dtTemp);
                        dob.Text = dtTemp.ToString("dd/MM/yyyy");
                        status.Text = reader["Status"].ToString();
                        gName.Text = reader["RelativeName"].ToString();
                        gAddress.Text = reader["RelativeAdd"].ToString();
                        poscode.Text = reader["Postcode"].ToString();
                        cityState.Text = reader["CityState"].ToString();
                        resTelNo.Text = reader["PhoneNo1"].ToString();
                        offTelNo.Text = reader["PhoneNo2"].ToString();
                    }
                }

                if (resTelNo.Text == "")
                {
                    resTelNo.Text = "-";
                }
                if (offTelNo.Text == "")
                {
                    offTelNo.Text = "-";
                }
                ClearAllText(Panel2);           // Delete the existing value in the textbox belonging to previous patient
                hideTextBox(partTwo);           // Hide the remark textbox in part 2
                resetRadioButton();             // Reset the radio button to default
                resetDropDownList(partThree);   // Reset the drop-down list in part 3 to default
                hideTextBox(partThree);         // Hide the remark textbox in part 3
                resetDropDownList(partFour);    // Reset the drop-down list in part 4 to default
                resetCheckBox(partFive);
                hideTextBox(partFive);

                // read from MEDCHECKUP table
                cmd.CommandText = "SELECT [Height], [Weight], [Pulse], [Eye_Test_OnGlass_Right], [BloodPressure], [Eye_Test_OnGlass_Left], "
                                + "[Eye_Test_NoGlass_Left], [Eye_Test_NoGlass_Right] FROM [General] WHERE (([AccountNo] = @AccountNo) AND "
                                + "([Expr1] = 'Y') AND ([StatusActive] = 'Y') AND ([Status] = 0))";
                SqlParameter accountNoParam = new SqlParameter("@AccountNo", SqlDbType.BigInt);
                accountNoParam.Value = accNumber.Text;
                cmd.Parameters.Add(accountNoParam);
                cmd.Prepare();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        height.Text = reader["Height"].ToString();
                        weight.Text = reader["Weight"].ToString();
                        pulse.Text = reader["Pulse"].ToString();
                        bp1.Text = reader["BloodPressure"].ToString();
                        noSpecs1.Text = reader["Eye_Test_NoGlass_Right"].ToString();
                        noSpecs2.Text = reader["Eye_Test_NoGlass_Left"].ToString();
                        withSpecs1.Text = reader["Eye_Test_OnGlass_Right"].ToString();
                        withSpecs2.Text = reader["Eye_Test_OnGlass_Left"].ToString();
                    }
                }

                // read from MED_HISTORY table
                cmd.CommandText = "SELECT * FROM [MedHist] WHERE (([AccountNo] = @AccountNo2) AND ([StatusActive] = 'Y') "
                                + "AND ([Expr1] = 'Y') AND ([Status] = 0))";
                SqlParameter accountNoParam2 = new SqlParameter("@AccountNo2", SqlDbType.BigInt);
                accountNoParam2.Value = accNumber.Text;
                cmd.Parameters.Add(accountNoParam2);
                cmd.Prepare();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (reader["S_Congenital_Inherit"].ToString() == "1")
                        {
                            setYesRadioButton("S_Congenital_Inherit");
                        }
                        if (reader["F_Congenital_Inherit"].ToString() == "1")
                        {
                            setYesRadioButton("F_Congenital_Inherit");
                        }
                        if (radioBtn1.Checked || radioBtn3.Checked)
                        {
                            remark1.Text = reader["R_Congenital_Inherit"].ToString();
                            remark1.Style["display"] = "block";
                        }
                        if (reader["S_Allergy"].ToString() == "1")
                        {
                            setYesRadioButton("S_Allergy");
                        }
                        if (reader["F_Allergy"].ToString() == "1")
                        {
                            setYesRadioButton("F_Allergy");
                        }
                        if (radioBtn5.Checked || radioBtn7.Checked)
                        {
                            remark2.Text = reader["R_Allergy"].ToString();
                            remark2.Style["display"] = "block";
                        }
                        if (reader["S_Mental_Illness"].ToString() == "1")
                        {
                            setYesRadioButton("S_Mental_Illness");
                        }
                        if (reader["F_Mental_Illness"].ToString() == "1")
                        {
                            setYesRadioButton("F_Mental_Illness");
                        }
                        if (radioBtn9.Checked || radioBtn11.Checked)
                        {
                            remark3.Text = reader["R_Mental_Illness"].ToString();
                            remark3.Style["display"] = "block";
                        }
                        if (reader["S_Fits_Stroke"].ToString() == "1")
                        {
                            setYesRadioButton("S_Fits_Stroke");
                        }
                        if (reader["F_Fits_Stroke"].ToString() == "1")
                        {
                            setYesRadioButton("F_Fits_Stroke");
                        }
                        if (radioBtn13.Checked || radioBtn15.Checked)
                        {
                            remark4.Text = reader["R_Fits_Stroke"].ToString();
                            remark4.Style["display"] = "block";
                        }
                        if (reader["S_Diabetes"].ToString() == "1")
                        {
                            setYesRadioButton("S_Diabetes");
                        }
                        if (reader["F_Diabetes"].ToString() == "1")
                        {
                            setYesRadioButton("F_Diabetes");
                        }
                        if (radioBtn17.Checked || radioBtn19.Checked)
                        {
                            remark5.Text = reader["R_Diabetes"].ToString();
                            remark5.Style["display"] = "block";
                        }
                        if (reader["S_Hypertension"].ToString() == "1")
                        {
                            setYesRadioButton("S_Hypertension");
                        }
                        if (reader["F_Hypertension"].ToString() == "1")
                        {
                            setYesRadioButton("F_Hypertension");
                        }
                        if (radioBtn21.Checked || radioBtn23.Checked)
                        {
                            remark6.Text = reader["R_Hypertension"].ToString();
                            remark6.Style["display"] = "block";
                        }
                        if (reader["S_Heart_VascularDis"].ToString() == "1")
                        {
                            setYesRadioButton("S_Heart_VascularDis");
                        }
                        if (reader["F_Heart_VascularDis"].ToString() == "1")
                        {
                            setYesRadioButton("F_Heart_VascularDis");
                        }
                        if (radioBtn25.Checked || radioBtn27.Checked)
                        {
                            remark7.Text = reader["R_Heart_VascularDis"].ToString();
                            remark7.Style["display"] = "block";
                        }
                        if (reader["S_Asthma"].ToString() == "1")
                        {
                            setYesRadioButton("S_Asthma");
                        }
                        if (reader["F_Asthma"].ToString() == "1")
                        {
                            setYesRadioButton("F_Asthma");
                        }
                        if (radioBtn29.Checked || radioBtn31.Checked)
                        {
                            remark8.Text = reader["R_Asthma"].ToString();
                            remark8.Style["display"] = "block";
                        }
                        if (reader["S_Kidney_Dis"].ToString() == "1")
                        {
                            setYesRadioButton("S_Kidney_Dis");
                        }
                        if (reader["F_Kidney_Dis"].ToString() == "1")
                        {
                            setYesRadioButton("F_Kidney_Dis");
                        }
                        if (radioBtn33.Checked || radioBtn35.Checked)
                        {
                            remark9.Text = reader["R_Kidney_Dis"].ToString();
                            remark9.Style["display"] = "block";
                        }
                        if (reader["S_Cancer"].ToString() == "1")
                        {
                            setYesRadioButton("S_Cancer");
                        }
                        if (reader["F_Cancer"].ToString() == "1")
                        {
                            setYesRadioButton("F_Cancer");
                        }
                        if (radioBtn37.Checked || radioBtn39.Checked)
                        {
                            remark10.Text = reader["R_Cancer"].ToString();
                            remark10.Style["display"] = "block";
                        }
                        if (reader["S_Tuberculosis"].ToString() == "1")
                        {
                            setYesRadioButton("S_Tuberculosis");
                        }
                        if (reader["F_Tuberculosis"].ToString() == "1")
                        {
                            setYesRadioButton("F_Tuberculosis");
                        }
                        if (radioBtn41.Checked || radioBtn43.Checked)
                        {
                            remark11.Text = reader["R_Tuberculosis"].ToString();
                            remark11.Style["display"] = "block";
                        }
                        if (reader["S_Drug_Addict"].ToString() == "1")
                        {
                            setYesRadioButton("S_Drug_Addict");
                        }
                        if (reader["F_Drug_Addict"].ToString() == "1")
                        {
                            setYesRadioButton("F_Drug_Addict");
                        }
                        if (radioBtn45.Checked || radioBtn47.Checked)
                        {
                            remark12.Text = reader["R_Drug_Addict"].ToString();
                            remark12.Style["display"] = "block";
                        }
                        if (reader["S_AIDS_HIV"].ToString() == "1")
                        {
                            setYesRadioButton("S_AIDS_HIV");
                        }
                        if (reader["F_AIDS_HIV"].ToString() == "1")
                        {
                            setYesRadioButton("F_AIDS_HIV");
                        }
                        if (radioBtn49.Checked || radioBtn51.Checked)
                        {
                            remark13.Text = reader["R_AIDS_HIV"].ToString();
                            remark13.Style["display"] = "block";
                        }
                        if (reader["S_History_Surgery"].ToString() == "1")
                        {
                            setYesRadioButton("S_History_Surgery");
                        }
                        if (reader["F_History_Surgery"].ToString() == "1")
                        {
                            setYesRadioButton("F_History_Surgery");
                        }
                        if (radioBtn53.Checked || radioBtn55.Checked)
                        {
                            remark14.Text = reader["R_History_Surgery"].ToString();
                            remark14.Style["display"] = "block";
                        }
                        if (reader["S_Other_Illness"].ToString() == "1")
                        {
                            setYesRadioButton("S_Other_Illness");
                        }
                        if (reader["F_Other_Illness"].ToString() == "1")
                        {
                            setYesRadioButton("F_Other_Illness");
                        }
                        if (radioBtn57.Checked || radioBtn59.Checked)
                        {
                            remark15.Text = reader["R_Other_Illness"].ToString();
                            remark15.Style["display"] = "block";
                        }
                    }
                }
                // read from IMMUNISATION table
                cmd.CommandText = "SELECT * FROM [ImmuHist] WHERE (([AccountNo] = @AccountNo3) AND ([StatusActive] = 'Y') "
                                + "AND ([Expr1] = 'Y') AND ([Status] = 0))";

                SqlParameter accountNoParam3 = new SqlParameter("@AccountNo3", SqlDbType.BigInt);
                accountNoParam3.Value = accNumber.Text;
                cmd.Parameters.Add(accountNoParam3);
                cmd.Prepare();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        DateTime dtTemp;
                        if (reader["YellowFever_Status"].ToString() == "1")
                        {
                            yellowFeverY.Checked = true;
                            yellowFeverN.Checked = false;

                            DateTime.TryParse(reader["YellowFever_From"].ToString(), out dtTemp);
                            yellowFeverFrom.Text = dtTemp.ToString("dd/MM/yyyy");
                            yellowFeverFrom.Style["display"] = "block";
                            DateTime.TryParse(reader["YellowFever_To"].ToString(), out dtTemp);
                            yellowFeverTo.Text = dtTemp.ToString("dd/MM/yyyy");
                            yellowFeverTo.Style["display"] = "block";
                        }
                        if (reader["BCG_Status"].ToString() == "1")
                        {
                            bcgY.Checked = true;
                            bcgN.Checked = false;

                            DateTime.TryParse(reader["BCG_From"].ToString(), out dtTemp);
                            bcgFrom.Text = dtTemp.ToString("dd/MM/yyyy");
                            bcgFrom.Style["display"] = "block";
                            DateTime.TryParse(reader["BCG_To"].ToString(), out dtTemp);
                            bcgTo.Text = dtTemp.ToString("dd/MM/yyyy");
                            bcgTo.Style["display"] = "block";
                        }
                        if (reader["Typhoid_Status"].ToString() == "1")
                        {
                            typhoidY.Checked = true;
                            typhoidN.Checked = false;

                            DateTime.TryParse(reader["Typhoid_From"].ToString(), out dtTemp);
                            typhoidFrom.Text = dtTemp.ToString("dd/MM/yyyy");
                            typhoidFrom.Style["display"] = "block";
                            DateTime.TryParse(reader["Typhoid_To"].ToString(), out dtTemp);
                            typhoidTo.Text = dtTemp.ToString("dd/MM/yyyy");
                            typhoidTo.Style["display"] = "block";
                        }
                        if (reader["Meningitis_Status"].ToString() == "1")
                        {
                            meningtisY.Checked = true;
                            meningtisN.Checked = false;

                            DateTime.TryParse(reader["Meningitis_From"].ToString(), out dtTemp);
                            meningtisFrom.Text = dtTemp.ToString("dd/MM/yyyy");
                            meningtisFrom.Style["display"] = "block";
                            DateTime.TryParse(reader["Meningitis_To"].ToString(), out dtTemp);
                            meningtisTo.Text = dtTemp.ToString("dd/MM/yyyy");
                            meningtisTo.Style["display"] = "block";
                        }
                        if (reader["HepatitisB_Status"].ToString() == "1")
                        {
                            hepBY.Checked = true;
                            hepBN.Checked = false;

                            DateTime.TryParse(reader["HepatitisB_From"].ToString(), out dtTemp);
                            hepBFrom.Text = dtTemp.ToString("dd/MM/yyyy");
                            hepBFrom.Style["display"] = "block";
                            DateTime.TryParse(reader["HepatitisB_To"].ToString(), out dtTemp);
                            hepBTo.Text = dtTemp.ToString("dd/MM/yyyy");
                            hepBTo.Style["display"] = "block";
                        }
                    }
                }
                // read from DOCTOR_CHECK table
                cmd.CommandText = "SELECT * FROM [BodySys] WHERE (([AccountNo] = @AccountNo4) AND ([StatusActive] = 'Y') "
                                + "AND ([Expr1] = 'Y') AND ([Status] = 0))";

                SqlParameter accountNoParam4 = new SqlParameter("@AccountNo4", SqlDbType.BigInt);
                accountNoParam4.Value = accNumber.Text;
                cmd.Parameters.Add(accountNoParam4);
                cmd.Prepare();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        pallor.SelectedIndex = Convert.ToInt32(reader["Palor"].ToString());
                        cyanosis.SelectedIndex = Convert.ToInt32(reader["Sinosis"].ToString());
                        edema.SelectedIndex = Convert.ToInt32(reader["Edema"].ToString());
                        jaundice.SelectedIndex = Convert.ToInt32(reader["Jundis"].ToString());
                        lymphNodes.SelectedIndex = Convert.ToInt32(reader["Nodus_Limfa"].ToString());
                        skinChronic.SelectedIndex = Convert.ToInt32(reader["Kulit_Kronik"].ToString());
                        funduscopy.SelectedIndex = Convert.ToInt32(reader["Fundoskopi"].ToString());
                        if (funduscopy.SelectedIndex == 1)
                        {
                            funduscopyTextBox.Text = reader["Fundo_Remark"].ToString();
                            funduscopyTextBox.Style["display"] = "block";
                        }
                        colorBlind.SelectedIndex = Convert.ToInt32(reader["Rabun_Warna"].ToString());
                        if (colorBlind.SelectedIndex == 1)
                        {
                            colorBlindTextBox.Text = reader["RWarna_Remark"].ToString();
                            colorBlindTextBox.Style["display"] = "block";
                        }
                        ear.SelectedIndex = Convert.ToInt32(reader["Telinga"].ToString());
                        if (ear.SelectedIndex == 1)
                        {
                            earTextBox.Text = reader["Telinga_Remark"].ToString();
                            earTextBox.Style["display"] = "block";
                        }
                        mouthTeeth.SelectedIndex = Convert.ToInt32(reader["Ruang_MulutGigi"].ToString());
                        if (mouthTeeth.SelectedIndex == 1)
                        {
                            mouthTeethTextBox.Text = reader["MulutGigi_Remark"].ToString();
                            mouthTeethTextBox.Style["display"] = "block";
                        }
                        respSystem.SelectedIndex = Convert.ToInt32(reader["Respiratori"].ToString());
                        if (respSystem.SelectedIndex == 1)
                        {
                            respSystemTextBox.Text = reader["Respi_Remark"].ToString();
                            respSystemTextBox.Style["display"] = "block";
                        }
                        chestXRay.SelectedIndex = Convert.ToInt32(reader["Xray_Dada"].ToString());
                        if (chestXRay.SelectedIndex == 1)
                        {
                            chestXRayTextBox.Text = reader["Xray_Remark"].ToString();
                            chestXRayTextBox.Style["display"] = "block";
                        }
                        abdomenCavity.SelectedIndex = Convert.ToInt32(reader["Abdomen"].ToString());
                        if (abdomenCavity.SelectedIndex == 1)
                        {
                            abdomenCavityTextBox.Text = reader["Abdomen_Remark"].ToString();
                            abdomenCavityTextBox.Style["display"] = "block";
                        }
                        nervesMental.SelectedIndex = Convert.ToInt32(reader["Saraf_Mental"].ToString());
                        if (nervesMental.SelectedIndex == 1)
                        {
                            nervesMentalTextBox.Text = reader["Saraf_Remark"].ToString();
                            nervesMentalTextBox.Style["display"] = "block";
                        }
                        muscularSys.SelectedIndex = Convert.ToInt32(reader["Muskulisketal"].ToString());
                        if (muscularSys.SelectedIndex == 1)
                        {
                            muscularSysTextBox.Text = reader["Musku_Remark"].ToString();
                            muscularSysTextBox.Style["display"] = "block";
                        }
                        othersTextBox.Text = reader["Others"].ToString();
                        xray.Text = reader["XRay_Acc_FK"].ToString();
                    }
                }
                // read from LAB table
                cmd.CommandText = "SELECT * FROM [Lab] WHERE (([AccountNo] = @AccountNo5) AND ([StatusActive] = 'Y') "
                                + "AND ([Expr1] = 'Y') AND ([Status] = 0))";

                SqlParameter accountNoParam5 = new SqlParameter("@AccountNo5", SqlDbType.BigInt);
                accountNoParam5.Value = accNumber.Text;
                cmd.Parameters.Add(accountNoParam5);
                cmd.Prepare();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        sugar.SelectedIndex = sugar.Items.IndexOf(sugar.Items.FindByValue(reader["gula"].ToString()));
                        albumin.SelectedIndex = albumin.Items.IndexOf(albumin.Items.FindByValue(reader["Albumin"].ToString()));
                        rbc.Text = reader["Rbc"].ToString();
                        pusCell.Text = reader["Pus_Cell"].ToString();
                        cast.SelectedIndex = cast.Items.IndexOf(cast.Items.FindByValue(reader["Cast"].ToString()));
                        crystal.SelectedIndex = crystal.Items.IndexOf(crystal.Items.FindByValue(reader["Crystal"].ToString()));
            
                        /*                                doctor verification                             */
                        if (!DBNull.Value.Equals(reader["VerifyDate"]))
                        {
                            DateTime dtTemp;
                            DateTime.TryParse(reader["VerifyDate"].ToString(), out dtTemp);
                            VerifyDate.Text = dtTemp.ToString("dd/MM/yyyy");
                        }
                        else
                        {
                            VerifyDate.Text = DateTime.Today.ToString("dd/MM/yyyy");

                        }

                        noProblem.Checked = Convert.ToInt32(reader["Dr_Verify1_Status"].ToString()) == 1;
                        cboxDisease.Checked = Convert.ToInt32(reader["Dr_Verify2_Status"].ToString()) == 1;
                        if (cboxDisease.Checked)
                        {
                            disease.Text = reader["Dr_Verify2_Remark"].ToString();
                            disease.Style["display"] = "block";
                        }
                        else
                        {
                            disease.Style["display"] = "none";
                        }

                        cboxSuggestion.Checked = Convert.ToInt32(reader["Dr_Verify3_Status"].ToString()) == 1;
                        if (cboxSuggestion.Checked)
                        {
                            suggestion.Text = reader["Dr_Verify3_Remark"].ToString();
                            suggestion.Style["display"] = "block";
                        }
                        else
                        {
                            suggestion.Style["display"] = "none";
                        }
            

                        /*                                doctor verification                             */
                        if (citizenship.Text == "Malaysian")
                        {
                            break;
                        }
                        else
                        {
                            nonMalaysian.Style["display"] = "block";
                            opiate.SelectedIndex = opiate.Items.IndexOf(opiate.Items.FindByValue(reader["Opiate"].ToString()));
                            cannabis.SelectedIndex = cannabis.Items.IndexOf(cannabis.Items.FindByValue(reader["Cannabis"].ToString()));
                            amp.SelectedIndex = amp.Items.IndexOf(amp.Items.FindByValue(reader["Amphetamins"].ToString()));
                            metH.SelectedIndex = metH.Items.IndexOf(metH.Items.FindByValue(reader["Met_Hetamins"].ToString()));
                            ketamine.SelectedIndex = ketamine.Items.IndexOf(ketamine.Items.FindByValue(reader["Ketamine"].ToString()));
                            malaParasite.SelectedIndex = malaParasite.Items.IndexOf(malaParasite.Items.FindByValue(reader["MalariaP"].ToString()));
                            vdrl.SelectedIndex = vdrl.Items.IndexOf(vdrl.Items.FindByValue(reader["VDRL"].ToString()));
                            hepBAg.SelectedIndex = hepBAg.Items.IndexOf(hepBAg.Items.FindByValue(reader["Hep_BAg"].ToString()));
                            hepBAb.Text = reader["Hep_Bab"].ToString();
                            hepC.SelectedIndex = hepC.Items.IndexOf(hepC.Items.FindByValue(reader["Hep_C"].ToString()));
                            hiv.SelectedIndex = hiv.Items.IndexOf(hiv.Items.FindByValue(reader["HIV"].ToString()));
                        }
                    }
                }
            }
        }
    }
    private static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString; // ConnectionString is the name of my connection
    }
    protected void ClearAllText(Control con)
    {
        foreach (Control c in con.Controls)
        {
            if (c is TextBox)
                ((TextBox)c).Text = "";
            else
                ClearAllText(c);
        }
    }
    protected void hideTextBox(Control con)
    {
        foreach (Control c in con.Controls)
        {
            if (c is TextBox)
            {
                if (c.ClientID != "othersTextBox")
                {
                    ((TextBox)c).Style["display"] = "none";
                }
            }
            else
                hideTextBox(c);
        }
    }
    protected void showAndHideTextBoxPart3()
    {
        foreach (Control c in partThree.Controls)
        {
            if (c is DropDownList)
            {
                if (c.ID != "pallor" && c.ID != "cyanosis" && c.ID != "edema" &&
                     c.ID != "jaundice" && c.ID != "lymphNodes" && c.ID != "skinChronic")
                {
                    DropDownList ddl = (DropDownList)c.Parent.FindControl(c.ID);
                    if (ddl.SelectedIndex == 0)
                    {
                        TextBox tb = (TextBox)c.Parent.FindControl(ddl.ID + "TextBox");
                        tb.Style["display"] = "none";
                    }
                    else
                    {
                        TextBox tb = (TextBox)c.Parent.FindControl(ddl.ID + "TextBox");
                        tb.Style["display"] = "block";
                    }
                }
            }
        }
    }

    protected void showAndHideTextBoxPart2()
    {
        /*                 medical history                   */
        if (radioBtn1.Checked || radioBtn3.Checked)
        {
            remark1.Style["display"] = "block";
        }
        else { remark1.Style["display"] = "none"; }
        if (radioBtn5.Checked || radioBtn7.Checked)
        {
            remark2.Style["display"] = "block";
        }
        else { remark2.Style["display"] = "none"; }
        if (radioBtn9.Checked || radioBtn11.Checked)
        {
            remark3.Style["display"] = "block";
        }
        else { remark3.Style["display"] = "none"; }
        if (radioBtn13.Checked || radioBtn15.Checked)
        {
            remark4.Style["display"] = "block";
        }
        else { remark4.Style["display"] = "none"; }
        if (radioBtn17.Checked || radioBtn19.Checked)
        {
            remark5.Style["display"] = "block";
        }
        else { remark5.Style["display"] = "none"; }
        if (radioBtn21.Checked || radioBtn23.Checked)
        {
            remark6.Style["display"] = "block";
        }
        else { remark6.Style["display"] = "none"; }
        if (radioBtn25.Checked || radioBtn27.Checked)
        {
            remark7.Style["display"] = "block";
        }
        else { remark7.Style["display"] = "none"; }
        if (radioBtn29.Checked || radioBtn31.Checked)
        {
            remark8.Style["display"] = "block";
        }
        else { remark8.Style["display"] = "none"; }
        if (radioBtn33.Checked || radioBtn35.Checked)
        {
            remark9.Style["display"] = "block";
        }
        else { remark9.Style["display"] = "none"; }
        if (radioBtn37.Checked || radioBtn39.Checked)
        {
            remark10.Style["display"] = "block";
        }
        else { remark10.Style["display"] = "none"; }
        if (radioBtn41.Checked || radioBtn43.Checked)
        {
            remark11.Style["display"] = "block";
        }
        else { remark11.Style["display"] = "none"; }
        if (radioBtn45.Checked || radioBtn47.Checked)
        {
            remark12.Style["display"] = "block";
        }
        else { remark12.Style["display"] = "none"; }
        if (radioBtn49.Checked || radioBtn51.Checked)
        {
            remark13.Style["display"] = "block";
        }
        else { remark13.Style["display"] = "none"; }
        if (radioBtn53.Checked || radioBtn55.Checked)
        {
            remark14.Style["display"] = "block";
        }
        else { remark14.Style["display"] = "none"; }
        if (radioBtn57.Checked || radioBtn59.Checked)
        {
            remark15.Style["display"] = "block";
        }
        else { remark15.Style["display"] = "none"; }

        /*                 immunization history                   */
        if (yellowFeverY.Checked)
        {
            yellowFeverFrom.Style["display"] = "block";
            yellowFeverTo.Style["display"] = "block";
        }
        else
        {
            yellowFeverFrom.Style["display"] = "none";
            yellowFeverTo.Style["display"] = "none";
        }
        if (bcgY.Checked)
        {
            bcgFrom.Style["display"] = "block";
            bcgTo.Style["display"] = "block";
        }
        else
        {
            bcgFrom.Style["display"] = "none";
            bcgTo.Style["display"] = "none";
        }
        if (typhoidY.Checked)
        {
            typhoidFrom.Style["display"] = "block";
            typhoidTo.Style["display"] = "block";
        }
        else
        {
            typhoidFrom.Style["display"] = "none";
            typhoidTo.Style["display"] = "none";
        }
        if (meningtisY.Checked)
        {
            meningtisFrom.Style["display"] = "block";
            meningtisTo.Style["display"] = "block";
        }
        else
        {
            meningtisFrom.Style["display"] = "none";
            meningtisTo.Style["display"] = "none";
        }
        if (hepBY.Checked)
        {
            hepBFrom.Style["display"] = "block";
            hepBTo.Style["display"] = "block";
        }
        else
        {
            hepBFrom.Style["display"] = "none";
            hepBTo.Style["display"] = "none";
        }
    }
    protected void showAndHideTextBoxPart5()
    {
        disease.Style["display"] = (cboxDisease.Checked) ? "block" : "none";
        suggestion.Style["display"] = (cboxSuggestion.Checked) ? "block" : "none";
    }
    protected void resetRadioButton()
    {
        foreach (var rbCtrl in partTwo.Controls.OfType<RadioButton>())
        {
            if (rbCtrl.Attributes["value"].ToString() == "no")
            {
                rbCtrl.Checked = true;
            }
            else
            {
                rbCtrl.Checked = false;
            }
        }
    }
    protected void resetDropDownList(Control con)
    {
        foreach (Control c in con.Controls)
        {
            if (c is DropDownList)
                ((DropDownList)c).SelectedIndex = 0;
            else
                resetDropDownList(c);
        }
    }
    protected void resetCheckBox(Control con)
    {
        foreach (Control c in con.Controls)
        {
            if (c is CheckBox)
                ((CheckBox)c).Checked = false;
            else
                resetCheckBox(c);
        }
    }
    protected void setYesRadioButton(string medicalHistoryColumnName)
    {
        string[] arrMedHistory = new string[] { "S_Congenital_Inherit", "F_Congenital_Inherit", "S_Allergy", "F_Allergy", "S_Mental_Illness",
                                                "F_Mental_Illness","S_Fits_Stroke","F_Fits_Stroke","S_Diabetes","F_Diabetes","S_Hypertension",
                                                "F_Hypertension","S_Heart_VascularDis","F_Heart_VascularDis","S_Asthma","F_Asthma",
                                                "S_Kidney_Dis, F_Kidney_Dis","S_Cancer","F_Cancer","S_Tuberculosis","F_Tuberculosis",
                                                "S_Drug_Addict, F_Drug_Addict","S_AIDS_HIV","F_AIDS_HIV","S_History_Surgery",
                                                "F_History_Surgery, S_Other_Illness","F_Other_Illness"  };
        for (int i = 0; i < arrMedHistory.Length; i++)
        {
            if (medicalHistoryColumnName == arrMedHistory[i])
            {
                int counter = 0;
                foreach (var rbCtrl in partTwo.Controls.OfType<RadioButton>())
                {
                    if (counter < i)
                    {
                        counter++;
                        continue;
                    }
                    else
                    {
                        string firstRadioId = "radioBtn" + (i * 2 + 1);
                        string secondRadioId = "radioBtn" + (i * 2 + 2);
                        if (rbCtrl.ID == firstRadioId || rbCtrl.ID == secondRadioId)
                        {
                            if (rbCtrl.ID == firstRadioId)
                            {
                                rbCtrl.Checked = true;
                            }
                            else
                            {
                                rbCtrl.Checked = false;
                                break;
                            }
                        }
                    }
                }
                break;
            }
        }
    }
    protected void saveBtn1_Click(object sender, EventArgs e)
    {
        using (SqlConnection myConnection = new SqlConnection(GetConnectionString()))
        {
            myConnection.Open();
            SqlCommand cmd = new SqlCommand(null, myConnection);
            SqlParameter insert2Param, pkParam;
            int insertionChecker = 0;

            cmd.CommandText = "SELECT [MedCheck_PK] FROM PKU_RME INNER JOIN PKU_RME_MEDCHECKUP ON RME_PK = RME_FK WHERE [AccountNo] = @AccountNo";
            SqlParameter accountNoParam = new SqlParameter("@AccountNo", SqlDbType.BigInt);
            accountNoParam.Value = accNumber.Text;
            cmd.Parameters.Add(accountNoParam);

            cmd.Prepare();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    // SQL prepared statement for update of general examination.
                    cmd.CommandText = "UPDATE PKU_RME_MEDCHECKUP SET Height=@Height, Weight=@Weight, Pulse=@Pulse, BloodPressure=@BloodPressure, "
                                    + "Eye_Test_NoGlass_Right=@noSpecs1, Eye_Test_NoGlass_Left=@noSpecs2, Eye_Test_OnGlass_Right=@withSpecs1, "
                                    + "Eye_Test_OnGlass_Left=@withSpecs2 WHERE ( ([MedCheck_PK] = @MedCheck_PK) AND (StatusActive = 'Y') )";
                    if (reader.Read())
                    {
                        pkParam = new SqlParameter("@MedCheck_PK", SqlDbType.Int);
                        pkParam.Value = Convert.ToInt32(reader["MedCheck_PK"]);
                        cmd.Parameters.Add(pkParam);
                    }
                }
                else
                {
                    // SQL prepared statement for insertion into general examination.
                    cmd.CommandText = "INSERT INTO PKU_RME_MEDCHECKUP (RME_FK, Height, Weight, Pulse, BloodPressure, Eye_Test_NoGlass_Right, "
                                    + "Eye_Test_NoGlass_Left, Eye_Test_OnGlass_Right, Eye_Test_OnGlass_Left, StatusActive) VALUES (@RME_FK, @Height, @Weight, "
                                    + "@Pulse, @BloodPressure, @noSpecs1, @noSpecs2, @withSpecs1, @withSpecs2, @StatusActive)";
                    insertionChecker++;
                }
            }

            if (insertionChecker != 0)
            {
                SqlCommand cmd2 = new SqlCommand(null, myConnection);
                cmd2.CommandText = "SELECT [RME_PK] FROM PKU_RME WHERE [AccountNo] = @AccountNo2";
                SqlParameter accountNoParam2 = new SqlParameter("@AccountNo2", SqlDbType.BigInt);
                accountNoParam2.Value = accNumber.Text;
                cmd2.Parameters.Add(accountNoParam2);
                cmd2.Prepare();

                using (SqlDataReader reader = cmd2.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        insert2Param = new SqlParameter("@RME_FK", SqlDbType.Int);
                        insert2Param.Value = Convert.ToInt32(reader["RME_PK"]);
                        cmd.Parameters.Add(insert2Param);

                        insert2Param = new SqlParameter("@StatusActive", SqlDbType.Char, 1);
                        insert2Param.Value = 'Y';
                        cmd.Parameters.Add(insert2Param);
                    }
                }
            }

            SqlParameter heightParam = new SqlParameter("@Height", SqlDbType.Decimal);
            heightParam.Precision = 4;
            heightParam.Scale = 1;
            SqlParameter weightParam = new SqlParameter("@Weight", SqlDbType.Decimal);
            weightParam.Precision = 4;
            weightParam.Scale = 1;
            SqlParameter pulseParam = new SqlParameter("@Pulse", SqlDbType.TinyInt);
            SqlParameter bpParam = new SqlParameter("@BloodPressure", SqlDbType.NVarChar, 50);

            SqlParameter noSpecRightParam = new SqlParameter("@noSpecs1", SqlDbType.NVarChar, 50);
            SqlParameter noSpecLeftParam = new SqlParameter("@noSpecs2", SqlDbType.NVarChar, 50);
            SqlParameter withSpecRightParam = new SqlParameter("@withSpecs1", SqlDbType.NVarChar, 50);
            SqlParameter withSpecLeftParam = new SqlParameter("@withSpecs2", SqlDbType.NVarChar, 50);

            noSpecRightParam.Value = noSpecs1.Text;
            noSpecLeftParam.Value = noSpecs2.Text;
            withSpecRightParam.Value = withSpecs1.Text;
            withSpecLeftParam.Value = withSpecs2.Text;

            heightParam.Value = Convert.ToDecimal(height.Text);
            weightParam.Value = Convert.ToDecimal(weight.Text);
            pulseParam.Value = Convert.ToInt32(pulse.Text);
            bpParam.Value = bp1.Text;
            cmd.Parameters.Add(heightParam);
            cmd.Parameters.Add(weightParam);
            cmd.Parameters.Add(pulseParam);
            cmd.Parameters.Add(bpParam);

            cmd.Parameters.Add(noSpecRightParam);
            cmd.Parameters.Add(noSpecLeftParam);
            cmd.Parameters.Add(withSpecRightParam);
            cmd.Parameters.Add(withSpecLeftParam);

            cmd.Prepare();
            cmd.ExecuteNonQuery();

            // Change the status of part1 in PKU_RME
            cmd.CommandText = "UPDATE PKU_RME SET part1='1' WHERE [AccountNo] = @AccountNo3";
            SqlParameter part1StatusParam = new SqlParameter("@part1", SqlDbType.Char, 1);
            SqlParameter accountNoParam3 = new SqlParameter("@AccountNo3", SqlDbType.BigInt);
            accountNoParam3.Value = accNumber.Text;
            if (string.IsNullOrEmpty(noSpecs1.Text) || string.IsNullOrEmpty(noSpecs2.Text) || string.IsNullOrEmpty(withSpecs1.Text) ||
                string.IsNullOrEmpty(withSpecs2.Text) || string.IsNullOrEmpty(height.Text) || string.IsNullOrEmpty(weight.Text) ||
                string.IsNullOrEmpty(pulse.Text) || string.IsNullOrEmpty(bp1.Text))
            {
                part1StatusParam.Value = '0';
            }
            else
            {
                part1StatusParam.Value = '1';
            }
            cmd.Parameters.Add(accountNoParam3);
            cmd.Parameters.Add(part1StatusParam);
            cmd.Prepare();
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Successfully Save');", true);
        }
    }
    protected void saveBtn2_Click(object sender, EventArgs e)
    {
        using (SqlConnection myConnection = new SqlConnection(GetConnectionString()))
        {
            myConnection.Open();
            SqlCommand cmd = new SqlCommand(null, myConnection);

            int insertionChecker = 0;

            // SQL prepared statement for selection medical history.
            cmd.CommandText = "SELECT [Med_His_PK] FROM PKU_RME INNER JOIN PKU_RME_MED_HISTORY ON RME_PK = RME_FK WHERE [AccountNo] = @AccountNo";
            SqlParameter accountNoParam = new SqlParameter("@AccountNo", SqlDbType.BigInt);
            accountNoParam.Value = accNumber.Text;
            cmd.Parameters.Add(accountNoParam);

            cmd.Prepare();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    cmd.CommandText = "UPDATE PKU_RME_MED_HISTORY SET S_Congenital_Inherit=@rBtnSelf1, F_Congenital_Inherit=@rBtnSelf2, "
                                    + "R_Congenital_Inherit=@remark1, S_Allergy=@rBtnSelf3, F_Allergy=@rBtnSelf4, R_Allergy=@remark2, "
                                    + "S_Mental_Illness=@rBtnSelf5, F_Mental_Illness=@rBtnSelf6, R_Mental_Illness=@remark3, "
                                    + "S_Fits_Stroke=@rBtnSelf7, F_Fits_Stroke=@rBtnSelf8, R_Fits_Stroke=@remark4, S_Diabetes=@rBtnSelf9, "
                                    + "F_Diabetes=@rBtnSelf10, R_Diabetes=@remark5, S_Hypertension=@rBtnSelf11, F_Hypertension=@rBtnSelf12, "
                                    + "R_Hypertension=@remark6, S_Heart_VascularDis=@rBtnSelf13, F_Heart_VascularDis=@rBtnSelf14, "
                                    + "R_Heart_VascularDis=@remark7, S_Asthma=@rBtnSelf15, F_Asthma=@rBtnSelf16, R_Asthma=@remark8, "
                                    + "S_Kidney_Dis=@rBtnSelf17, F_Kidney_Dis=@rBtnSelf18, R_Kidney_Dis=@remark9, S_Cancer=@rBtnSelf19, "
                                    + "F_Cancer=@rBtnSelf20, R_Cancer=@remark10, S_Tuberculosis=@rBtnSelf21, F_Tuberculosis=@rBtnSelf22, "
                                    + "R_Tuberculosis=@remark11, S_Drug_Addict=@rBtnSelf23, F_Drug_Addict=@rBtnSelf24, R_Drug_Addict=@remark12, "
                                    + "S_AIDS_HIV=@rBtnSelf25, F_AIDS_HIV=@rBtnSelf26, R_AIDS_HIV=@remark13, S_History_Surgery=@rBtnSelf27, "
                                    + "F_History_Surgery=@rBtnSelf28, R_History_Surgery=@remark14, S_Other_Illness=@rBtnSelf29, "
                                    + "F_Other_Illness=@rBtnSelf30, R_Other_Illness=@remark15 WHERE ( ([Med_His_PK] = @Med_His_PK) AND (StatusActive = 'Y') )";
                    if (reader.Read())
                    {
                        SqlParameter pkParam = new SqlParameter("@Med_His_PK", SqlDbType.Int);
                        pkParam.Value = Convert.ToInt32(reader["Med_His_PK"]);
                        cmd.Parameters.Add(pkParam);
                    }
                }
                else
                {
                    // SQL prepared statement for insertion into general examination.
                    cmd.CommandText = "INSERT INTO PKU_RME_MED_HISTORY (RME_FK, S_Congenital_Inherit, F_Congenital_Inherit, R_Congenital_Inherit, "
                                    + "S_Allergy, F_Allergy, R_Allergy, S_Mental_Illness, F_Mental_Illness, R_Mental_Illness, S_Fits_Stroke, "
                                    + "F_Fits_Stroke, R_Fits_Stroke, S_Diabetes, F_Diabetes, R_Diabetes, S_Hypertension, F_Hypertension, "
                                    + "R_Hypertension, S_Heart_VascularDis, F_Heart_VascularDis, R_Heart_VascularDis, S_Asthma, F_Asthma, "
                                    + "R_Asthma, S_Kidney_Dis, F_Kidney_Dis, R_Kidney_Dis, S_Cancer, F_Cancer, R_Cancer, S_Tuberculosis, "
                                    + "F_Tuberculosis, R_Tuberculosis, S_Drug_Addict, F_Drug_Addict, R_Drug_Addict, S_AIDS_HIV, F_AIDS_HIV, "
                                    + "R_AIDS_HIV, S_History_Surgery, F_History_Surgery, R_History_Surgery, S_Other_Illness, F_Other_Illness, "
                                    + "R_Other_Illness, StatusActive) "
                                    + "VALUES (@RME_FK, @rBtnSelf1, @rBtnSelf2, @remark1, @rBtnSelf3, @rBtnSelf4, @remark2, @rBtnSelf5, @rBtnSelf6, "
                                    + "@remark3, @rBtnSelf7, @rBtnSelf8, @remark4, @rBtnSelf9, @rBtnSelf10, @remark5, @rBtnSelf11, @rBtnSelf12, "
                                    + "@remark6, @rBtnSelf13, @rBtnSelf14, @remark7, @rBtnSelf15, @rBtnSelf16, @remark8, @rBtnSelf17, "
                                    + "@rBtnSelf18, @remark9, @rBtnSelf19, @rBtnSelf20, @remark10, @rBtnSelf21, @rBtnSelf22, @remark11, "
                                    + "@rBtnSelf23, @rBtnSelf24, @remark12, @rBtnSelf25, @rBtnSelf26, @remark13, @rBtnSelf27, @rBtnSelf28, "
                                    + "@remark14, @rBtnSelf29, @rBtnSelf30, @remark15, @StatusActive)";
                    insertionChecker++;
                }
            }

            if (insertionChecker != 0)
            {
                SqlCommand cmd2 = new SqlCommand(null, myConnection);
                cmd2.CommandText = "SELECT [RME_PK] FROM PKU_RME WHERE [AccountNo] = @AccountNo2";
                SqlParameter accountNoParam2 = new SqlParameter("@AccountNo2", SqlDbType.BigInt);

                accountNoParam2.Value = accNumber.Text;
                cmd2.Parameters.Add(accountNoParam2);
                cmd2.Prepare();

                using (SqlDataReader reader = cmd2.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        SqlParameter pkParam = new SqlParameter("@RME_FK2", SqlDbType.Int);
                        pkParam.Value = Convert.ToInt32(reader["RME_PK"]);
                        cmd.Parameters.Add(pkParam);

                        SqlParameter statusParam = new SqlParameter("@StatusActive", SqlDbType.Char, 1);
                        statusParam.Value = 'Y';
                        cmd.Parameters.Add(statusParam);
                    }
                }
            }
            List<SqlParameter> prm = new List<SqlParameter>()
            {
                new SqlParameter("@rBtnSelf1", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn1.Checked)},
                new SqlParameter("@rBtnSelf2", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn3.Checked)},
                new SqlParameter("@rBtnSelf3", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn5.Checked)},
                new SqlParameter("@rBtnSelf4", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn7.Checked)},
                new SqlParameter("@rBtnSelf5", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn9.Checked)},
                new SqlParameter("@rBtnSelf6", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn11.Checked)},
                new SqlParameter("@rBtnSelf7", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn13.Checked)},
                new SqlParameter("@rBtnSelf8", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn15.Checked)},
                new SqlParameter("@rBtnSelf9", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn17.Checked)},
                new SqlParameter("@rBtnSelf10", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn19.Checked)},
                new SqlParameter("@rBtnSelf11", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn21.Checked)},
                new SqlParameter("@rBtnSelf12", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn23.Checked)},
                new SqlParameter("@rBtnSelf13", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn25.Checked)},
                new SqlParameter("@rBtnSelf14", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn27.Checked)},
                new SqlParameter("@rBtnSelf15", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn29.Checked)},
                new SqlParameter("@rBtnSelf16", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn31.Checked)},
                new SqlParameter("@rBtnSelf17", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn33.Checked)},
                new SqlParameter("@rBtnSelf18", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn35.Checked)},
                new SqlParameter("@rBtnSelf19", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn37.Checked)},
                new SqlParameter("@rBtnSelf20", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn39.Checked)},
                new SqlParameter("@rBtnSelf21", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn41.Checked)},
                new SqlParameter("@rBtnSelf22", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn43.Checked)},
                new SqlParameter("@rBtnSelf23", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn45.Checked)},
                new SqlParameter("@rBtnSelf24", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn47.Checked)},
                new SqlParameter("@rBtnSelf25", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn49.Checked)},
                new SqlParameter("@rBtnSelf26", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn51.Checked)},
                new SqlParameter("@rBtnSelf27", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn53.Checked)},
                new SqlParameter("@rBtnSelf28", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn55.Checked)},
                new SqlParameter("@rBtnSelf29", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn57.Checked)},
                new SqlParameter("@rBtnSelf30", SqlDbType.TinyInt) {Value = Convert.ToInt32(radioBtn59.Checked)},
                
                new SqlParameter("@remark1", SqlDbType.VarChar, 250) {Value = remark1.Text},
                new SqlParameter("@remark2", SqlDbType.VarChar, 250) {Value = remark2.Text},
                new SqlParameter("@remark3", SqlDbType.VarChar, 250) {Value = remark3.Text},
                new SqlParameter("@remark4", SqlDbType.VarChar, 250) {Value = remark4.Text},
                new SqlParameter("@remark5", SqlDbType.VarChar, 250) {Value = remark5.Text},
                new SqlParameter("@remark6", SqlDbType.VarChar, 250) {Value = remark6.Text},
                new SqlParameter("@remark7", SqlDbType.VarChar, 250) {Value = remark7.Text},
                new SqlParameter("@remark8", SqlDbType.VarChar, 250) {Value = remark8.Text},
                new SqlParameter("@remark9", SqlDbType.VarChar, 250) {Value = remark9.Text},
                new SqlParameter("@remark10", SqlDbType.VarChar, 250) {Value = remark10.Text},
                new SqlParameter("@remark11", SqlDbType.VarChar, 250) {Value = remark11.Text},
                new SqlParameter("@remark12", SqlDbType.VarChar, 250) {Value = remark12.Text},
                new SqlParameter("@remark13", SqlDbType.VarChar, 250) {Value = remark13.Text},
                new SqlParameter("@remark14", SqlDbType.VarChar, 250) {Value = remark14.Text},
                new SqlParameter("@remark15", SqlDbType.VarChar, 250) {Value = remark15.Text},
            };
            cmd.Parameters.AddRange(prm.ToArray());

            cmd.Prepare();
            cmd.ExecuteNonQuery();

            // SQL prepared statement for selection medical history.
            cmd.CommandText = "SELECT [Immunisation_PK] FROM PKU_RME INNER JOIN PKU_RME_IMMUNISATION ON RME_PK = RME_FK WHERE [AccountNo] = @AccountNo3";
            SqlParameter accountNoParam3 = new SqlParameter("@AccountNo3", SqlDbType.BigInt);
            accountNoParam3.Value = accNumber.Text;
            cmd.Parameters.Add(accountNoParam3);
            insertionChecker = 0;

            cmd.Prepare();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    cmd.CommandText = "UPDATE PKU_RME_IMMUNISATION SET YellowFever_Status=@rBtnVaccine1, YellowFever_From=@yellowFeverFrom, "
                                    + "YellowFever_To=@yellowFeverTo, BCG_Status=@rBtnVaccine2, BCG_From=@bcgFrom, BCG_To=@bcgTo, "
                                    + "Typhoid_Status=@rBtnVaccine3, Typhoid_From=@typhoidFrom, Typhoid_To=@typhoidTo, "
                                    + "Meningitis_Status=@rBtnVaccine4, Meningitis_From=@meningtisFrom, Meningitis_To=@meningtisTo, "
                                    + "HepatitisB_Status=@rBtnVaccine5, HepatitisB_From=@hepBFrom, HepatitisB_To=@hepBTo "
                                    + "WHERE ( ([Immunisation_PK] = @Immunisation_PK) AND (StatusActive = 'Y') )";
                    if (reader.Read())
                    {
                        SqlParameter pkParam = new SqlParameter("@Immunisation_PK", SqlDbType.Int);
                        pkParam.Value = Convert.ToInt32(reader["Immunisation_PK"]);
                        cmd.Parameters.Add(pkParam);
                    }
                }
                else
                {
                    // SQL prepared statement for insertion into general examination.
                    cmd.CommandText = "INSERT INTO PKU_RME_IMMUNISATION (RME_FK, YellowFever_Status, YellowFever_From, YellowFever_To, "
                                    + "BCG_Status, BCG_From, BCG_To, Typhoid_Status, Typhoid_From, Typhoid_To, Meningitis_Status, "
                                    + "Meningitis_From, Meningitis_To, HepatitisB_Status, HepatitisB_From, HepatitisB_To, StatusActive)"
                                    + "VALUES (@RME_FK, @rBtnVaccine1, @yellowFeverFrom, @yellowFeverTo, @rBtnVaccine2, @bcgFrom, @bcgTo, "
                                    + "@rBtnVaccine3, @typhoidFrom, @typhoidTo, @rBtnVaccine4, @meningtisFrom, @meningtisTo, @rBtnVaccine5, "
                                    + "@hepBFrom, @hepBTo, @StatusActive)";
                    insertionChecker++;
                }
            }

            if (insertionChecker != 0)
            {
                SqlCommand cmd2 = new SqlCommand(null, myConnection);
                cmd2.CommandText = "SELECT [RME_PK] FROM PKU_RME WHERE [AccountNo] = @AccountNo4";
                SqlParameter accountNoParam4 = new SqlParameter("@AccountNo4", SqlDbType.BigInt);
                accountNoParam4.Value = accNumber.Text;
                cmd2.Parameters.Add(accountNoParam4);
                cmd2.Prepare();

                using (SqlDataReader reader = cmd2.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        SqlParameter pkParam = new SqlParameter("@RME_FK", SqlDbType.Int);
                        pkParam.Value = Convert.ToInt32(reader["RME_PK"]);
                        cmd.Parameters.Add(pkParam);

                        SqlParameter statusParam = new SqlParameter("@StatusActive", SqlDbType.Char, 1);
                        statusParam.Value = 'Y';
                        cmd.Parameters.Add(statusParam);
                    }
                }
            }

            SqlParameter YellowFever_Status_Param = new SqlParameter("@rBtnVaccine1", SqlDbType.TinyInt);
            SqlParameter YellowFever_From_Param = new SqlParameter("@yellowFeverFrom", SqlDbType.Date);
            SqlParameter YellowFever_To_Param = new SqlParameter("@yellowFeverTo", SqlDbType.Date);

            SqlParameter BCG_Status_Param = new SqlParameter("@rBtnVaccine2", SqlDbType.TinyInt);
            SqlParameter BCG_From_Param = new SqlParameter("@bcgFrom", SqlDbType.Date);
            SqlParameter BCG_To_Param = new SqlParameter("@bcgTo", SqlDbType.Date);

            SqlParameter Typhoid_Status_Param = new SqlParameter("@rBtnVaccine3", SqlDbType.TinyInt);
            SqlParameter Typhoid_From_Param = new SqlParameter("@typhoidFrom", SqlDbType.Date);
            SqlParameter Typhoid_To_Param = new SqlParameter("@typhoidTo", SqlDbType.Date);

            SqlParameter Meningitis_Status_Param = new SqlParameter("@rBtnVaccine4", SqlDbType.TinyInt);
            SqlParameter Meningitis_From_Param = new SqlParameter("@meningtisFrom", SqlDbType.Date);
            SqlParameter Meningitis_To_Param = new SqlParameter("@meningtisTo", SqlDbType.Date);

            SqlParameter HepatitisB_Status_Param = new SqlParameter("@rBtnVaccine5", SqlDbType.TinyInt);
            SqlParameter HepatitisB_From_Param = new SqlParameter("@hepBFrom", SqlDbType.Date);
            SqlParameter HepatitisB_To_Param = new SqlParameter("@hepBTo", SqlDbType.Date);

            DateTime date;
            YellowFever_Status_Param.Value = Convert.ToInt32(yellowFeverY.Checked);
            if (!string.IsNullOrEmpty(yellowFeverFrom.Text) && !string.IsNullOrEmpty(yellowFeverTo.Text))
            {
                date = DateTime.ParseExact(yellowFeverFrom.Text, "dd/MM/yyyy", null);
                YellowFever_From_Param.Value = date;
                date = DateTime.ParseExact(yellowFeverTo.Text, "dd/MM/yyyy", null);
                YellowFever_To_Param.Value = date;
            }
            else
            {
                YellowFever_From_Param.Value = DBNull.Value;
                YellowFever_To_Param.Value = DBNull.Value;
            }

            BCG_Status_Param.Value = Convert.ToInt32(bcgY.Checked);
            if (!string.IsNullOrEmpty(bcgFrom.Text) && !string.IsNullOrEmpty(bcgTo.Text))
            {
                date = DateTime.ParseExact(bcgFrom.Text, "dd/MM/yyyy", null);
                BCG_From_Param.Value = date;
                date = DateTime.ParseExact(bcgTo.Text, "dd/MM/yyyy", null);
                BCG_To_Param.Value = date;
            }
            else
            {
                BCG_From_Param.Value = DBNull.Value;
                BCG_To_Param.Value = DBNull.Value;
            }

            Typhoid_Status_Param.Value = Convert.ToInt32(typhoidY.Checked);
            if (!string.IsNullOrEmpty(typhoidFrom.Text) && !string.IsNullOrEmpty(typhoidTo.Text))
            {
                date = DateTime.ParseExact(typhoidFrom.Text, "dd/MM/yyyy", null);
                Typhoid_From_Param.Value = date;
                date = DateTime.ParseExact(typhoidTo.Text, "dd/MM/yyyy", null);
                Typhoid_To_Param.Value = date;
            }
            else
            {
                Typhoid_From_Param.Value = DBNull.Value;
                Typhoid_To_Param.Value = DBNull.Value;
            }

            Meningitis_Status_Param.Value = Convert.ToInt32(meningtisY.Checked);
            if (!string.IsNullOrEmpty(meningtisFrom.Text) && !string.IsNullOrEmpty(meningtisTo.Text))
            {
                date = DateTime.ParseExact(meningtisFrom.Text, "dd/MM/yyyy", null);
                Meningitis_From_Param.Value = date;
                date = DateTime.ParseExact(meningtisTo.Text, "dd/MM/yyyy", null);
                Meningitis_To_Param.Value = date;
            }
            else
            {
                Meningitis_From_Param.Value = DBNull.Value;
                Meningitis_To_Param.Value = DBNull.Value;
            }

            HepatitisB_Status_Param.Value = Convert.ToInt32(hepBY.Checked);
            if (!string.IsNullOrEmpty(hepBFrom.Text) && !string.IsNullOrEmpty(hepBTo.Text))
            {
                date = DateTime.ParseExact(hepBFrom.Text, "dd/MM/yyyy", null);
                HepatitisB_From_Param.Value = date;
                date = DateTime.ParseExact(hepBTo.Text, "dd/MM/yyyy", null);
                HepatitisB_To_Param.Value = date;
            }
            else
            {
                HepatitisB_From_Param.Value = DBNull.Value;
                HepatitisB_To_Param.Value = DBNull.Value;
            }

            cmd.Parameters.Add(YellowFever_Status_Param);
            cmd.Parameters.Add(YellowFever_From_Param);
            cmd.Parameters.Add(YellowFever_To_Param);
            cmd.Parameters.Add(BCG_Status_Param);
            cmd.Parameters.Add(BCG_From_Param);
            cmd.Parameters.Add(BCG_To_Param);
            cmd.Parameters.Add(Typhoid_Status_Param);
            cmd.Parameters.Add(Typhoid_From_Param);
            cmd.Parameters.Add(Typhoid_To_Param);
            cmd.Parameters.Add(Meningitis_Status_Param);
            cmd.Parameters.Add(Meningitis_From_Param);
            cmd.Parameters.Add(Meningitis_To_Param);
            cmd.Parameters.Add(HepatitisB_Status_Param);
            cmd.Parameters.Add(HepatitisB_From_Param);
            cmd.Parameters.Add(HepatitisB_To_Param);

            cmd.Prepare();
            cmd.ExecuteNonQuery();

            // Change the status of part2 in PKU_RME
            cmd.CommandText = "UPDATE PKU_RME SET part2='1' WHERE [AccountNo] = @AccountNo5";
            SqlParameter accountNoParam5 = new SqlParameter("@AccountNo5", SqlDbType.BigInt);
            accountNoParam5.Value = accNumber.Text;
            cmd.Parameters.Add(accountNoParam5);
            cmd.Prepare();
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Successfully Save');", true);
        }
    }
    protected void saveBtn3_Click(object sender, EventArgs e)
    {
        using (SqlConnection myConnection = new SqlConnection(GetConnectionString()))
        {
            myConnection.Open();
            SqlCommand cmd = new SqlCommand(null, myConnection);

            int insertionChecker = 0;

            // SQL prepared statement for selection medical history.
            cmd.CommandText = "SELECT [Doc_Check_PK] FROM PKU_RME INNER JOIN PKU_RME_DOCTOR_CHECK ON RME_PK = RME_FK WHERE [AccountNo] = @AccountNo";
            SqlParameter accountNoParam = new SqlParameter("@AccountNo", SqlDbType.BigInt);
            accountNoParam.Value = accNumber.Text;
            cmd.Parameters.Add(accountNoParam);

            cmd.Prepare();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    cmd.CommandText = "UPDATE PKU_RME_DOCTOR_CHECK SET Palor=@pallor, Sinosis=@cyanosis, Edema=@edema, Jundis=@jaundice, "
                                    + "Nodus_Limfa=@lymphNodes, Kulit_Kronik=@skinChronic, Fundoskopi=@funduscopy, "
                                    + "Fundo_Remark=@funduscopyTextBox, Rabun_Warna=@colorBlind, RWarna_Remark=@colorBlindTextBox, "
                                    + "Telinga=@ear, Telinga_Remark=@earTextBox, Ruang_MulutGigi=@mouthTeeth, "
                                    + "MulutGigi_Remark=@mouthTeethTextBox, Respiratori=@respSystem, Respi_Remark=@respSystemTextBox, "
                                    + "Xray_Dada=@chestXRay, Xray_Remark=@chestXRayTextBox, Abdomen=@abdomenCavity, "
                                    + "Abdomen_Remark=@abdomenCavityTextBox, Saraf_Mental=@nervesMental, Saraf_Remark=@nervesMentalTextBox, "
                                    + "Muskulisketal=@muscularSys, Musku_Remark=@muscularSysTextBox, Others=@othersTextBox "
                                    + "WHERE ( ([Doc_Check_PK] = @Doc_Check_PK) AND (StatusActive = 'Y') )";
                    if (reader.Read())
                    {
                        SqlParameter pkParam = new SqlParameter("@Doc_Check_PK", SqlDbType.Int);
                        pkParam.Value = Convert.ToInt32(reader["Doc_Check_PK"]);
                        cmd.Parameters.Add(pkParam);
                    }
                }
                else
                {
                    // SQL prepared statement for insertion into general examination.
                    cmd.CommandText = "INSERT INTO PKU_RME_DOCTOR_CHECK (RME_FK, Palor, Sinosis, Edema, Jundis, Nodus_Limfa, "
                                    + "Kulit_Kronik, Fundoskopi, Fundo_Remark, Rabun_Warna, RWarna_Remark, Telinga, "
                                    + "Telinga_Remark, Ruang_MulutGigi, MulutGigi_Remark, Respiratori, Respi_Remark, Xray_Dada, "
                                    + "Xray_Remark, Abdomen, Abdomen_Remark, Saraf_Mental, Saraf_Remark, Muskulisketal, "
                                    + "Musku_Remark, Others, StatusActive)"
                                    + "VALUES (@RME_FK, @pallor, @cyanosis, @edema, @jaundice, @lymphNodes, @skinChronic, "
                                    + "@funduscopy, @funduscopyTextBox, @colorBlind, @colorBlindTextBox, @ear, @earTextBox, "
                                    + "@mouthTeeth, @mouthTeethTextBox, @respSystem, @respSystemTextBox, @chestXRay, "
                                    + "@chestXRayTextBox, @abdomenCavity, @abdomenCavityTextBox, @nervesMental, @nervesMentalTextBox, "
                                    + "@muscularSys, @muscularSysTextBox, @othersTextBox, @StatusActive)";
                    insertionChecker++;
                }
            }
            if (insertionChecker != 0)
            {
                SqlCommand cmd2 = new SqlCommand(null, myConnection);
                cmd2.CommandText = "SELECT [RME_PK] FROM PKU_RME WHERE [AccountNo] = @AccountNo2";
                SqlParameter accountNoParam2 = new SqlParameter("@AccountNo2", SqlDbType.BigInt);
                accountNoParam2.Value = accNumber.Text;
                cmd2.Parameters.Add(accountNoParam2);
                cmd2.Prepare();

                using (SqlDataReader reader = cmd2.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        SqlParameter pkParam = new SqlParameter("@RME_FK", SqlDbType.Int);
                        pkParam.Value = Convert.ToInt32(reader["RME_PK"]);
                        cmd.Parameters.Add(pkParam);

                        SqlParameter statusParam = new SqlParameter("@StatusActive", SqlDbType.Char, 1);
                        statusParam.Value = 'Y';
                        cmd.Parameters.Add(statusParam);
                    }
                }
            }
            List<SqlParameter> prm = new List<SqlParameter>()
            {
                new SqlParameter("@pallor", SqlDbType.TinyInt) {Value = Convert.ToInt32(pallor.SelectedIndex)},
                new SqlParameter("@cyanosis", SqlDbType.TinyInt) {Value = Convert.ToInt32(cyanosis.SelectedIndex)},
                new SqlParameter("@edema", SqlDbType.TinyInt) {Value = Convert.ToInt32(edema.SelectedIndex)},
                new SqlParameter("@jaundice", SqlDbType.TinyInt) {Value = Convert.ToInt32(jaundice.SelectedIndex)},
                new SqlParameter("@lymphNodes", SqlDbType.TinyInt) {Value = Convert.ToInt32(lymphNodes.SelectedIndex)},
                new SqlParameter("@skinChronic", SqlDbType.TinyInt) {Value = Convert.ToInt32(skinChronic.SelectedIndex)},
                new SqlParameter("@funduscopy", SqlDbType.TinyInt) {Value = Convert.ToInt32(funduscopy.SelectedIndex)},
                new SqlParameter("@funduscopyTextBox", SqlDbType.VarChar, 200) {Value = funduscopyTextBox.Text.ToString()},
                new SqlParameter("@colorBlind", SqlDbType.TinyInt) {Value = Convert.ToInt32(colorBlind.SelectedIndex)},
                new SqlParameter("@colorBlindTextBox", SqlDbType.VarChar, 200) {Value = colorBlindTextBox.Text.ToString()},
                new SqlParameter("@ear", SqlDbType.TinyInt) {Value = Convert.ToInt32(ear.SelectedIndex)},
                new SqlParameter("@earTextBox", SqlDbType.VarChar, 200) {Value = earTextBox.Text.ToString()},
                new SqlParameter("@mouthTeeth", SqlDbType.TinyInt) {Value = Convert.ToInt32(mouthTeeth.SelectedIndex)},
                new SqlParameter("@mouthTeethTextBox", SqlDbType.VarChar, 200) {Value = mouthTeethTextBox.Text.ToString()},
                new SqlParameter("@respSystem", SqlDbType.TinyInt) {Value = Convert.ToInt32(respSystem.SelectedIndex)},
                new SqlParameter("@respSystemTextBox", SqlDbType.VarChar, 200) {Value = respSystemTextBox.Text.ToString()},
                new SqlParameter("@chestXRay", SqlDbType.TinyInt) {Value = Convert.ToInt32(chestXRay.SelectedIndex)},
                new SqlParameter("@chestXRayTextBox", SqlDbType.VarChar, 200) {Value = chestXRayTextBox.Text.ToString()},
                new SqlParameter("@abdomenCavity", SqlDbType.TinyInt) {Value = Convert.ToInt32(abdomenCavity.SelectedIndex)},
                new SqlParameter("@abdomenCavityTextBox", SqlDbType.VarChar, 200) {Value = abdomenCavityTextBox.Text.ToString()},
                new SqlParameter("@nervesMental", SqlDbType.TinyInt) {Value = Convert.ToInt32(nervesMental.SelectedIndex)},
                new SqlParameter("@nervesMentalTextBox", SqlDbType.VarChar, 200) {Value = nervesMentalTextBox.Text.ToString()},
                new SqlParameter("@muscularSys", SqlDbType.TinyInt) {Value = Convert.ToInt32(muscularSys.SelectedIndex)},
                new SqlParameter("@muscularSysTextBox", SqlDbType.VarChar, 200) {Value = muscularSysTextBox.Text.ToString()},
                new SqlParameter("@othersTextBox", SqlDbType.VarChar, 200) {Value = othersTextBox.Text.ToString()},
            };
            cmd.Parameters.AddRange(prm.ToArray());

            cmd.Prepare();
            cmd.ExecuteNonQuery();

            // Change status of part 3
            cmd.CommandText = "UPDATE PKU_RME SET part3='1' WHERE [AccountNo] = @AccountNo3";
            SqlParameter accountNoParam3 = new SqlParameter("@AccountNo3", SqlDbType.BigInt);
            accountNoParam3.Value = accNumber.Text;
            cmd.Parameters.Add(accountNoParam3);
            cmd.Prepare();
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Successfully Save');", true);
        }
    }
    protected void saveBtn4_Click(object sender, EventArgs e)
    {
        using (SqlConnection myConnection = new SqlConnection(GetConnectionString()))
        {
            myConnection.Open();
            SqlCommand cmd = new SqlCommand(null, myConnection);

            int insertionChecker = 0;

            // SQL prepared statement for selection medical history.
            cmd.CommandText = "SELECT [Lab_Result_PK] FROM PKU_RME INNER JOIN PKU_RME_LAB ON RME_PK = RME_FK WHERE [AccountNo] = @AccountNo";
            SqlParameter accountNoParam = new SqlParameter("@AccountNo", SqlDbType.BigInt);
            accountNoParam.Value = accNumber.Text;
            cmd.Parameters.Add(accountNoParam);

            cmd.Prepare();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    cmd.CommandText = "UPDATE PKU_RME_LAB SET Gula=@sugar, Albumin=@albumin, Rbc=@rbc, Pus_Cell=@pusCell, Cast=@cast, "
                                    + "Crystal=@crystal, Opiate=@opiate, Cannabis=@cannabis, Amphetamins=@amp, Met_Hetamins=@metH, "
                                    + "Ketamine=@ketamine, MalariaP=@malaParasite, VDRL=@vdrl, Hep_BAg=@hepBAg, Hep_Bab=@hepBAb, "
                                    + "Hep_C=@hepC, HIV=@hiv "
                                    + "WHERE ( ([Lab_Result_PK] = @Lab_Result_PK) AND (StatusActive = 'Y') )";
                    if (reader.Read())
                    {
                        SqlParameter pkParam = new SqlParameter("@Lab_Result_PK", SqlDbType.Int);
                        pkParam.Value = Convert.ToInt32(reader["Lab_Result_PK"]);
                        cmd.Parameters.Add(pkParam);
                    }
                }
                else
                {
                    // SQL prepared statement for insertion into general examination.
                    cmd.CommandText = "INSERT INTO PKU_RME_LAB (RME_FK, Gula, Albumin, Rbc, Pus_Cell, Cast, Crystal, Opiate, Cannabis, "
                                    + "Amphetamins, Met_Hetamins, Ketamine, MalariaP, VDRL, Hep_BAg, Hep_Bab, Hep_C, HIV, StatusActive) "
                                    + "VALUES (@RME_FK, @sugar, @albumin, @rbc, @pusCell, @cast, @crystal, @opiate, @cannabis, @amp, "
                                    + "@metH, @ketamine, @malaParasite, @vdrl, @hepBAg, @hepBAb, @hepC, @hiv, @StatusActive) ";
                    insertionChecker++;
                }
            }
            if (insertionChecker != 0)
            {
                SqlCommand cmd2 = new SqlCommand(null, myConnection);
                cmd2.CommandText = "SELECT [RME_PK] FROM PKU_RME WHERE [AccountNo] = @AccountNo2";
                SqlParameter accountNoParam2 = new SqlParameter("@AccountNo2", SqlDbType.BigInt);
                accountNoParam2.Value = accNumber.Text;
                cmd2.Parameters.Add(accountNoParam2);
                cmd2.Prepare();

                using (SqlDataReader reader = cmd2.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        SqlParameter pkParam = new SqlParameter("@RME_FK", SqlDbType.Int);
                        pkParam.Value = Convert.ToInt32(reader["RME_PK"]);
                        cmd.Parameters.Add(pkParam);

                        SqlParameter statusParam = new SqlParameter("@StatusActive", SqlDbType.Char, 1);
                        statusParam.Value = 'Y';
                        cmd.Parameters.Add(statusParam);
                    }
                }
            }
            //@RME_FK, @sugar, @albumin, @rbc, @pusCell, @cast, @crystal, @opiate, @cannabis, @amp, "
            //"@metH, @ketamine, @malaParasite, @vdrl, @hepBAg, @hepBAb, @hepC, @hiv
            List<SqlParameter> prm = new List<SqlParameter>()
            {
                new SqlParameter("@sugar", SqlDbType.VarChar, 30) {Value = sugar.SelectedValue.ToString()},
                new SqlParameter("@albumin", SqlDbType.VarChar, 30) {Value = albumin.SelectedValue.ToString()},
                new SqlParameter("@rbc", SqlDbType.VarChar, 30) {Value = rbc.Text.ToString()},
                new SqlParameter("@pusCell", SqlDbType.VarChar, 30) {Value = pusCell.Text.ToString()},
                new SqlParameter("@cast", SqlDbType.VarChar, 30) {Value = cast.SelectedValue.ToString()},
                new SqlParameter("@crystal", SqlDbType.VarChar, 30) {Value = crystal.SelectedValue.ToString()},
                
            };
            cmd.Parameters.AddRange(prm.ToArray());

            if (citizenship.Text == "Malaysian")
            {
                prm = new List<SqlParameter>()
                {
                    new SqlParameter("@opiate", SqlDbType.VarChar, 30) {Value = DBNull.Value},
                    new SqlParameter("@cannabis", SqlDbType.VarChar, 30) {Value = DBNull.Value},
                    new SqlParameter("@amp", SqlDbType.VarChar, 30) {Value = DBNull.Value},
                    new SqlParameter("@metH", SqlDbType.VarChar, 30) {Value = DBNull.Value},
                    new SqlParameter("@ketamine", SqlDbType.VarChar, 30) {Value = DBNull.Value},
                    new SqlParameter("@malaParasite", SqlDbType.VarChar, 30) {Value = DBNull.Value},
                    new SqlParameter("@vdrl", SqlDbType.VarChar, 30) {Value = DBNull.Value},
                    new SqlParameter("@hepBAg", SqlDbType.VarChar, 30) {Value = DBNull.Value},
                    new SqlParameter("@hepBAb", SqlDbType.VarChar, 30) {Value = DBNull.Value},
                    new SqlParameter("@hepC", SqlDbType.VarChar, 30) {Value = DBNull.Value},
                    new SqlParameter("@hiv", SqlDbType.VarChar, 30) {Value = DBNull.Value},
                };
                cmd.Parameters.AddRange(prm.ToArray());
            }
            else
            {
                prm = new List<SqlParameter>()
                {
                    new SqlParameter("@opiate", SqlDbType.VarChar, 30) {Value = opiate.SelectedValue.ToString()},
                    new SqlParameter("@cannabis", SqlDbType.VarChar, 30) {Value = cannabis.SelectedValue.ToString()},
                    new SqlParameter("@amp", SqlDbType.VarChar, 30) {Value = amp.SelectedValue.ToString()},
                    new SqlParameter("@metH", SqlDbType.VarChar, 30) {Value = metH.SelectedValue.ToString()},
                    new SqlParameter("@ketamine", SqlDbType.VarChar, 30) {Value = ketamine.SelectedValue.ToString()},
                    new SqlParameter("@malaParasite", SqlDbType.VarChar, 30) {Value = malaParasite.SelectedValue.ToString()},
                    new SqlParameter("@vdrl", SqlDbType.VarChar, 30) {Value = vdrl.SelectedValue.ToString()},
                    new SqlParameter("@hepBAg", SqlDbType.VarChar, 30) {Value = hepBAg.SelectedValue.ToString()},
                    new SqlParameter("@hepBAb", SqlDbType.VarChar, 30) {Value = hepBAb.Text.ToString()},
                    new SqlParameter("@hepC", SqlDbType.VarChar, 30) {Value = hepC.SelectedValue.ToString()},
                    new SqlParameter("@hiv", SqlDbType.VarChar, 30) {Value = hiv.SelectedValue.ToString()},
                };
                cmd.Parameters.AddRange(prm.ToArray());
            }
            cmd.Prepare();
            cmd.ExecuteNonQuery();

            // Change status of part 4
            cmd.CommandText = "UPDATE PKU_RME SET part4='1' WHERE [AccountNo] = @AccountNo3";
            SqlParameter accountNoParam3 = new SqlParameter("@AccountNo3", SqlDbType.BigInt);
            accountNoParam3.Value = accNumber.Text;
            cmd.Parameters.Add(accountNoParam3);
            cmd.Prepare();
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Successfully Save');", true);
        }
    }
    protected void saveBtn5_Click(object sender, EventArgs e)
    {
        using (SqlConnection myConnection = new SqlConnection(GetConnectionString()))
        {
            myConnection.Open();
            SqlCommand cmd = new SqlCommand(null, myConnection);

            // SQL prepared statement for selection medical history.
            cmd.CommandText = "UPDATE PKU_RME SET Dr_Verify1_Status=@noProblem, Dr_Verify2_Status=@cboxDisease, Dr_Verify2_Remark=@disease, "
                            + "Dr_Verify3_Status=@cboxSuggestion, Dr_Verify3_Remark=@suggestion , VerifyDate=@VerifyDate "
                            + "WHERE ( ([AccountNo] = @AccountNo) AND (StatusActive = 'Y') )";

            List<SqlParameter> prm = new List<SqlParameter>()
            {
                new SqlParameter("@VerifyDate", SqlDbType.Date) {Value = DateTime.ParseExact(VerifyDate.Text, "dd/MM/yyyy", null)},
                new SqlParameter("@noProblem", SqlDbType.TinyInt) {Value = Convert.ToInt32(noProblem.Checked)},
                new SqlParameter("@cboxDisease", SqlDbType.TinyInt) {Value = Convert.ToInt32(cboxDisease.Checked)},
                new SqlParameter("@disease", SqlDbType.NVarChar, 200) {Value = disease.Text.ToString()},
                new SqlParameter("@cboxSuggestion", SqlDbType.TinyInt) {Value = Convert.ToInt32(cboxSuggestion.Checked)},
                new SqlParameter("@suggestion", SqlDbType.NVarChar, 200) {Value = suggestion.Text.ToString()},   
            };
            cmd.Parameters.AddRange(prm.ToArray());

            SqlParameter accountNoParam = new SqlParameter("@AccountNo", SqlDbType.BigInt);
            accountNoParam.Value = accNumber.Text;
            cmd.Parameters.Add(accountNoParam);

            cmd.Prepare();
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Successfully Save');", true);
        }
    }
    protected void submitBtn_Click(object sender, EventArgs e)
    {
        using (SqlConnection myConnection = new SqlConnection(GetConnectionString()))
        {
            myConnection.Open();
            SqlCommand cmd = new SqlCommand(null, myConnection);

            // SQL prepared statement for selection medical history.
            cmd.CommandText = "UPDATE PKU_RME SET Status = 1 WHERE ( ([AccountNo] = @AccountNo) AND (StatusActive = 'Y') )";

            SqlParameter accountNoParam = new SqlParameter("@AccountNo", SqlDbType.BigInt);
            accountNoParam.Value = accNumber.Text;
            cmd.Parameters.Add(accountNoParam);

            cmd.Prepare();
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Successfully Submit');", true);
        }
    }
}