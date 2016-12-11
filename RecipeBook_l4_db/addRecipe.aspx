<%@ register TagPrefix="sp" TagName="Ingredient" Src="~/Ingredient.ascx" %>
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="addRecipe.aspx.cs" Inherits="addRecipe" %>
<%@ Reference  Control="~/Ingredient.ascx"%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <h3>Please add your new recipe here</h3>
    <p><asp:Label ID="lblRecipName" runat="server" Text="Recipe Name: " Width="200"></asp:Label><asp:TextBox ID="txtRecipeName" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="recipeNameReq" runat="server" ErrorMessage="<br/> Recipe name is required" ControlToValidate="txtRecipeName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></p>
    <p><asp:Label ID="lblOwner" runat="server" Text="Recipe Owner: " Width="200"></asp:Label><asp:TextBox ID="txtOwner" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="ownerReq" runat="server" ErrorMessage="<br/> Recipe owner is required" ControlToValidate="txtOwner" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></p>
    <p><asp:Label ID="lblCtgry" runat="server" Text="Category: " Width="200"></asp:Label>
        <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="SqlDataSourceddlcat" DataTextField="DESCIPTION" DataValueField="DESCIPTION">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceddlcat" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;DESCIPTION&quot; FROM &quot;CATEGORIES&quot;"></asp:SqlDataSource>
    </p>
        <p>
        <asp:TextBox ID="txtNewCtgry" runat="server"></asp:TextBox>
        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" OnClick="LinkButton1_Click">Add New Category</asp:LinkButton>
    </p>
    <p><asp:Label ID="lblTime" runat="server" Text="Cooking Time: " Width="200"></asp:Label><asp:TextBox ID="txtTime" runat="server" Width="50"></asp:TextBox> mins. <asp:CompareValidator ID="timeCheck" runat="server" ErrorMessage="* Cooking time must be number!" ControlToValidate="txtTime" ForeColor="Red" Display="Dynamic" Type="double"></asp:CompareValidator></p>
    <p><asp:Label ID="lblServings" runat="server" Text="Number of Servings: " Width="200"></asp:Label><asp:TextBox ID="txtServings" runat="server"></asp:TextBox> persons
        <asp:RequiredFieldValidator ID="servingReq" runat="server" ErrorMessage="<br/> Number of serving is required" ControlToValidate="txtServings" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></p>
    <p><asp:Label ID="lblDesc" runat="server" Text="Recipe Description: " Width="200"></asp:Label><asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Columns="60" Rows="5">
        </asp:TextBox><asp:RequiredFieldValidator ID="descReq" runat="server" ErrorMessage="<br/> Recipe description is required" ControlToValidate="txtDesc" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></p>
    <p>Listing of Ingredients: </p>
    <p>
        <asp:Label ID="lblIngredientName" runat="server" Text="Ingredient "></asp:Label>
        <asp:DropDownList ID="ddlIngr" runat="server" DataSourceID="SqlDataSourceddlingr" DataTextField="INGREDIENTNAME" DataValueField="INGREDIENTID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceddlingr" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;INGREDIENTS&quot; WHERE &quot;INGREDIENTID&quot; = ?" InsertCommand="INSERT INTO &quot;INGREDIENTS&quot; (&quot;INGREDIENTID&quot;, &quot;INGREDIENTNAME&quot;) VALUES (?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;INGREDIENTID&quot;, &quot;INGREDIENTNAME&quot; FROM &quot;INGREDIENTS&quot;" UpdateCommand="UPDATE &quot;INGREDIENTS&quot; SET &quot;INGREDIENTNAME&quot; = ? WHERE &quot;INGREDIENTID&quot; = ?">
            <DeleteParameters>
                <asp:Parameter Name="INGREDIENTID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="INGREDIENTID" Type="Decimal" />
                <asp:Parameter Name="INGREDIENTNAME" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="INGREDIENTNAME" Type="String" />
                <asp:Parameter Name="INGREDIENTID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Label ID="lblQty" runat="server" Text="Quantity "></asp:Label>
        <asp:TextBox ID="txtQty" runat="server"></asp:TextBox>
        <asp:Label ID="lblUnit" runat="server" Text="Unit"></asp:Label>
        <asp:DropDownList ID="ddlUnit" runat="server" DataSourceID="SqlDataSourceddlUnit" DataTextField="DESCIPTION" DataValueField="MEASUREMENTID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceddlUnit" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;MEASUREMENT&quot; WHERE &quot;MEASUREMENTID&quot; = ?" InsertCommand="INSERT INTO &quot;MEASUREMENT&quot; (&quot;MEASUREMENTID&quot;, &quot;DESCIPTION&quot;) VALUES (?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;MEASUREMENTID&quot;, &quot;DESCIPTION&quot; FROM &quot;MEASUREMENT&quot;" UpdateCommand="UPDATE &quot;MEASUREMENT&quot; SET &quot;DESCIPTION&quot; = ? WHERE &quot;MEASUREMENTID&quot; = ?">
            <DeleteParameters>
                <asp:Parameter Name="MEASUREMENTID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MEASUREMENTID" Type="Decimal" />
                <asp:Parameter Name="DESCIPTION" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="DESCIPTION" Type="String" />
                <asp:Parameter Name="MEASUREMENTID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>  <asp:Button ID="btnSubmit" runat="server" Text="Add your recipe" OnClick="btnSubmit_Click" /> <asp:Button ID="btnCancel" runat="server" Text="Clear all fields" CausesValidation="False" OnClick="btnCancel_Click" /></p>
</asp:Content>

