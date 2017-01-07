using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MXRAY_patient : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    
      DataView dv = (DataView) SqlDataSource2.Select(DataSourceSelectArguments.Empty);

      foreach (DataRowView drv in dv)
      {
          DataRow dr = drv.Row;
          lblAccountNo.Text = dr["accountNo"].ToString();
          lblMatrixNo.Text = dr["matricNo"].ToString();
          lblName.Text = dr["name"].ToString();
      }
    }

    protected void btnsave_click(object sender, EventArgs e)
    {
        DataView dv = (DataView) SqlDataSource2.Select(DataSourceSelectArguments.Empty);

      foreach (DataRowView drv in dv)
      {
          DataRow dr = drv.Row;
          lblAccountNo.Text = dr["accountNo"].ToString();
          lblMatrixNo.Text = dr["matricNo"].ToString();
          lblName.Text = dr["name"].ToString();

          SqlDataSource1.InsertCommand = "INSERT INTO Xray (account_no,name,xray_link,xray_no,create_date,status,class_name,part_name) VALUES (@accountNo,@name,@xray_link,@xray_no,@create_date,@status,@class_name,@part_name)";
          SqlDataSource1.InsertParameters.Add("accountNo", dr["accountNo"].ToString());
          SqlDataSource1.InsertParameters.Add("name", dr["name"].ToString());
          SqlDataSource1.InsertParameters.Add("xray_link", "test.dcm");
          SqlDataSource1.InsertParameters.Add("xray_no", "105910581");
          SqlDataSource1.InsertParameters.Add("create_date", DateTime.Now.ToString());
          SqlDataSource1.InsertParameters.Add("status", "Order");
          SqlDataSource1.InsertParameters.Add("class_name","RME");
          SqlDataSource1.InsertParameters.Add("part_name", "Chest");
          SqlDataSource1.Insert();
        
      }

        

    }
}