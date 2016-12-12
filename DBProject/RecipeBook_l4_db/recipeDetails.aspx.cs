using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using Oracle.ManagedDataAccess.Client;

public partial class recipeDetails : System.Web.UI.Page
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

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDetails();
            BindIngrediant();

        }
    }


    private void BindDetails()
    {
        int selectedRecipeID = (int)Session["selectedRecipeID"];
        string connectionstring =
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        OracleConnection conn = new OracleConnection();
        conn.ConnectionString = connectionstring;
        OracleCommand comm = conn.CreateCommand();
        try
        {
            comm.CommandType = CommandType.Text;
            comm.CommandText = "SELECT recipeid, recipename, recipeowner, DESCIPTION, cookingtime, serving#, description FROM recipes inner join categories on recipes.category = categories.catid where recipeid = :selectedRecipeID";
            comm.Parameters.Add("selectedRecipeId", OracleDbType.Int32, ParameterDirection.Input);
            comm.Parameters["selectedRecipeID"].Value = selectedRecipeID;
            DataTable table;
            comm.Connection.Open();
            OracleDataReader reader = comm.ExecuteReader();
            table = new DataTable();
            table.Load(reader);
            DetailsView1.DataSource = table;
            DetailsView1.DataKeyNames = new string[] { "recipeId" };
            DetailsView1.DataBind();
            reader.Close();
            comm.CommandText = "select ingredientName, quantity, desciption from recipe_ingredients ri, ingredients i, measurement m where recipeID = :selectedRecipeID and ri.ingredientid = i.ingredientid and ri.measurement = m.measurementid";
            OracleDataReader reader2 = comm.ExecuteReader();
            table = new DataTable();
            table.Load(reader2);
            gvIngredient.DataSource = table;
            gvIngredient.DataBind();
            reader2.Close();
        }
        catch (Exception ex)
        {

        }
        finally
        {
            comm.Connection.Close();
        }
    }

    private void BindIngrediant()
    {
        int selectedRecipeID = (int)Session["selectedRecipeID"];
        string connectionstring =
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        OracleConnection conn = new OracleConnection();
        conn.ConnectionString = connectionstring;
        OracleCommand comm = conn.CreateCommand();
        try
        {
            comm.CommandType = CommandType.Text;
            comm.CommandText = "select ingredientName, quantity, unit from recipe_ingredients ri, ingredients i where recipeID = :selectedRecipeID and ri.ingredientid = i.ingredientid";
            comm.Parameters.Add("selectedRecipeId", OracleDbType.Int32, ParameterDirection.Input);
            comm.Parameters["selectedRecipeID"].Value = selectedRecipeID;
            DataTable table;
            comm.Connection.Open();
            OracleDataReader reader = comm.ExecuteReader();
            table = new DataTable();
            table.Load(reader);
            gvIngredient.DataSource = table;
            gvIngredient.DataBind();
            reader.Close();
        }
        catch (Exception ex)
        {

        }
        finally
        {
            comm.Connection.Close();
        }
    }

    protected void DetailsView1_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        int recipeId = Convert.ToInt32(DetailsView1.DataKey.Value);
        string connectionstring =
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        OracleConnection conn = new OracleConnection();
        conn.ConnectionString = connectionstring;
        OracleCommand comm = conn.CreateCommand();
        comm.CommandType = CommandType.Text;
        comm.CommandText = "delete from recipes where recipeID = :selected_recipe";
        OracleParameter param = comm.Parameters.Add("selected_recipe", OracleDbType.Int32, ParameterDirection.Input);
        param.Value = recipeId;
        try
        {
            comm.Connection.Open();
            OracleDataReader reader = comm.ExecuteReader();
            reader.Close();
            Response.Redirect("recipes.aspx");
        }
        catch (Exception ex)
        {

        }
        finally
        {
            comm.Connection.Close();
        }
    }

    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        int recipeID = Convert.ToInt32(DetailsView1.DataKey.Value);

        string connectionstring =
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        OracleConnection conn = new OracleConnection();
        conn.ConnectionString = connectionstring;
        OracleCommand comm = conn.CreateCommand();
        comm.CommandType = CommandType.StoredProcedure;
        comm.CommandText = "UpdateRecipe";

        string newName = ((TextBox)DetailsView1.FindControl("txtNewName")).Text;
        int newCategoryID = Convert.ToInt32(((DropDownList)DetailsView1.FindControl("DropDownList1")).SelectedValue);
        string newDesc = ((TextBox)DetailsView1.FindControl("txtNewInstruction")).Text;

        comm.Parameters.Add("idselected", OracleDbType.Int32, ParameterDirection.Input);
        comm.Parameters["idselected"].Value = recipeID;
        comm.Parameters.Add("newName", OracleDbType.Varchar2, ParameterDirection.Input);
        comm.Parameters["newName"].Value = newName;
        comm.Parameters.Add("newCategoryID", OracleDbType.Int32, ParameterDirection.Input);
        comm.Parameters["newCategoryID"].Value = newCategoryID;
        comm.Parameters.Add("newDesc", OracleDbType.Varchar2, ParameterDirection.Input);
        comm.Parameters["newDesc"].Value = newDesc;

        try
        {
            comm.Connection.Open();
            comm.ExecuteNonQuery();
            DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
            BindDetails();
        }
        finally
        {
            conn.Close();
        }
    }

    protected void DetailsView1_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        DetailsView1.ChangeMode(e.NewMode);
        BindDetails();
    }
    protected void gvIngredient_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvIngredient.EditIndex = e.NewEditIndex; // index of the row is going to be edited
        BindIngrediant();
    }

    protected void gvIngredient_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvIngredient.EditIndex = -1; // index of the row is going to be edited
        BindIngrediant();
    }
    protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "addNew")
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
                comm.Parameters["newCateg"].Value = ((TextBox)DetailsView1.FindControl("newCategory")).Text;
                comm.Connection.Open();
                comm.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
            }
            finally
            {
                comm.Connection.Close();
            }
            ((DropDownList)DetailsView1.FindControl("DropDownList3")).DataBind();
        }
    }
    
}