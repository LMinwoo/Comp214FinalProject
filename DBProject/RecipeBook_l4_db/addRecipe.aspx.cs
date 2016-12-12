using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using Oracle.ManagedDataAccess.Client;

public partial class addRecipe : System.Web.UI.Page
{

    protected void Page_PreInit(object sender, EventArgs e)
    {
        switch ((string)Session["theme"])
        {
            case "dark":
                Page.Theme = "Dark";
                break;
            case "light":
                Page.Theme = "Light";
                break;
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/addRecipe.aspx", true);
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        string connectionstring =
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        OracleConnection conn = new OracleConnection();
        conn.ConnectionString = connectionstring;
        OracleCommand comm = conn.CreateCommand();
        comm.CommandType = CommandType.StoredProcedure;
        comm.CommandText = "InsertRecipe";

        string recipeNm = txtRecipeName.Text;
        string owner = txtOwner.Text;
        string category = ddlCategory.SelectedValue;
        int cookingT = Convert.ToInt32(txtTime.Text);
        int servings = Convert.ToInt32(txtServings.Text);
        string desc = txtDesc.Text;

        comm.Parameters.Add("recipNm", OracleDbType.Varchar2, ParameterDirection.Input);
        comm.Parameters["recipNm"].Value = recipeNm;
        comm.Parameters.Add("recipOwner", OracleDbType.Varchar2, ParameterDirection.Input);
        comm.Parameters["recipOwner"].Value = owner;
        comm.Parameters.Add("categryID", OracleDbType.Varchar2, ParameterDirection.Input);
        comm.Parameters["categryID"].Value = category;
        comm.Parameters.Add("cookingT", OracleDbType.Int32, ParameterDirection.Input);
        comm.Parameters["cookingT"].Value = cookingT;
        comm.Parameters.Add("servings", OracleDbType.Int32, ParameterDirection.Input);
        comm.Parameters["servings"].Value = servings;
        comm.Parameters.Add("descrip", OracleDbType.Varchar2, ParameterDirection.Input);
        comm.Parameters["descrip"].Value = desc;

        try
        {
            comm.Connection.Open();
            comm.ExecuteNonQuery();

        }
        finally
        {
            conn.Close();
        }
        AddIngredient();
        Response.Redirect("recipes.aspx");
    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string connectionstring =
                ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        OracleConnection conn = new OracleConnection();
        conn.ConnectionString = connectionstring;
        OracleCommand comm = conn.CreateCommand();
        try
        {
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "InsertCategory";
            comm.Parameters.Add("newCateg", OracleDbType.Varchar2, ParameterDirection.Input);
            comm.Parameters["newCateg"].Value = txtNewCtgry.Text;
            comm.Connection.Open();
            comm.ExecuteNonQuery();
        }
        
        finally
        {
            comm.Connection.Close();
        }
        ddlCategory.DataBind();
    }

    void AddIngredient()
    {
        string connectionstring =
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        OracleConnection conn = new OracleConnection();
        conn.ConnectionString = connectionstring;
        OracleCommand comm = conn.CreateCommand();
        comm.CommandType = CommandType.StoredProcedure;
        comm.CommandText = "InsertIngredientRecipe";

        int ingreid = Convert.ToInt32(ddlIngr.SelectedValue);
        int qty = Convert.ToInt32(txtQty.Text);
        int unit = Convert.ToInt32(ddlUnit.SelectedValue);

        comm.Parameters.Add("Ingreid", OracleDbType.Int32, ParameterDirection.Input);
        comm.Parameters["Ingreid"].Value = ingreid;
        comm.Parameters.Add("Unit", OracleDbType.Int32, ParameterDirection.Input);
        comm.Parameters["Unit"].Value = unit;
        comm.Parameters.Add("IngreQty", OracleDbType.Int32, ParameterDirection.Input);
        comm.Parameters["IngreQty"].Value = qty;


        try
        {
            comm.Connection.Open();
            comm.ExecuteNonQuery();

        }
        finally
        {
            conn.Close();
        }
    }

}