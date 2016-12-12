<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
    <h3>Search by:</h3>
    <p>
        Recipe owner:
        <asp:DropDownList ID="ddlOwner" runat="server"></asp:DropDownList>
    </p>
    <p>
        Category:
        <asp:DropDownList ID="ddlCtgry" runat="server"></asp:DropDownList>
    </p>
    <p>
        Ingredient:
        <asp:DropDownList ID="ddlIngredient" runat="server"></asp:DropDownList>
    </p>
    <p>
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
    </p>
    <p>
        <asp:GridView ID="gvSearchedRecipes" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvSearchedRecipes_SelectedIndexChanged1" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="recipeID" HeaderText="No." />
                <asp:BoundField DataField="RecipeName" HeaderText="Recipe Name" />
                <asp:BoundField DataField="cookingtime" HeaderText="Cooking Time" />
                <asp:BoundField DataField="serving#" HeaderText="# of Serving" />
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </p>
</asp:Content>

