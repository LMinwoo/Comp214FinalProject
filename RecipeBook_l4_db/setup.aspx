<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">
    
    protected void dark_Click(object sender, EventArgs e)
    {
        Session["theme"] = "dark";
        Response.Redirect("Home.aspx");
    }

    protected void light_Click(object sender, EventArgs e)
    {
        Session["theme"] = "light";
        Response.Redirect("Home.aspx");
    }
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
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>You can choose one of the two theme:</h3>
    <p><asp:Button ID="dark" runat="server" Text="Dark" OnClick="dark_Click" />&nbsp;&nbsp;<asp:Button ID="light" runat="server" Text="Light" OnClick="light_Click" /></p>
</asp:Content>

