using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class MRME_queue : System.Web.UI.Page
{
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            for ( int i=2; i<7; i++ )
            {
                Label newBtn = new Label();
                if (e.Row.Cells[i].Text == "0")
                {
                    newBtn.Text = "NOT DONE";
                    newBtn.ControlStyle.CssClass = "label label-danger";
                    e.Row.Cells[i].Controls.Add(newBtn);
                }
                else
                {
                    newBtn.Text = "DONE";
                    newBtn.ControlStyle.CssClass = "label label-success";
                    e.Row.Cells[i].Controls.Add(newBtn);
                }
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";
            }
        }
    }
    protected void GridView1_PageIndexChanging(object sender, EventArgs e)
    {
        GridView1_SelectedIndexChanged(sender,e);
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
}