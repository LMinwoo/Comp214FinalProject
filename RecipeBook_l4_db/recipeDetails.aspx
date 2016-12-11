<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="recipeDetails.aspx.cs" Inherits="recipeDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>&nbsp;</p>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="950px" style="margin-right: 2px" OnItemDeleting="DetailsView1_ItemDeleting" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnItemUpdating="DetailsView1_ItemUpdating" OnModeChanging="DetailsView1_ModeChanging" OnItemCommand="DetailsView1_ItemCommand" AutoGenerateRows="False">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:TemplateField HeaderText="Recipe Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txtNewName" runat="server" Text='<%# Bind("recipeName") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="txtNewName" runat="server" Text='<%# Bind("recipeName") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtNewName" runat="server" Text='<%# Bind("recipeName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceddlcat" DataTextField="DESCIPTION" DataValueField="CATID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceddlcat" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;CATID&quot;, &quot;DESCIPTION&quot; FROM &quot;CATEGORIES&quot;"></asp:SqlDataSource>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DESCIPTION") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("DESCIPTION") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Owner">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("recipeOwner") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Instruction">
                <EditItemTemplate>
                    <asp:TextBox ID="txtNewInstruction" runat="server" Text='<%# Bind("description") %>' Height="90px" TextMode="MultiLine" Width="245px"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="txtNewInstruction" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:GridView ID="gvIngredient" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" AutoGenerateColumns="False" OnRowCancelingEdit="gvIngredient_RowCancelingEdit" OnRowEditing="gvIngredient_RowEditing">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="Ingredient">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlIngrName" runat="server" DataSourceID="SqlDataSource2" DataTextField="INGREDIENTNAME" DataValueField="INGREDIENTID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;INGREDIENTS&quot; WHERE &quot;INGREDIENTID&quot; = ?" InsertCommand="INSERT INTO &quot;INGREDIENTS&quot; (&quot;INGREDIENTID&quot;, &quot;INGREDIENTNAME&quot;) VALUES (?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;INGREDIENTID&quot;, &quot;INGREDIENTNAME&quot; FROM &quot;INGREDIENTS&quot;" UpdateCommand="UPDATE &quot;INGREDIENTS&quot; SET &quot;INGREDIENTNAME&quot; = ? WHERE &quot;INGREDIENTID&quot; = ?">
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
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ingredientname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity">
                <EditItemTemplate>
                    <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Unit">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlMesure" runat="server" DataSourceID="SqlDataSource1" DataTextField="DESCIPTION" DataValueField="MEASUREMENTID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;L4_MEASUREMENT&quot; WHERE &quot;MEASUREMENTID&quot; = ? AND &quot;DESCIPTION&quot; = ?" InsertCommand="INSERT INTO &quot;L4_MEASUREMENT&quot; (&quot;MEASUREMENTID&quot;, &quot;DESCIPTION&quot;) VALUES (?, ?)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;MEASUREMENTID&quot;, &quot;DESCIPTION&quot; FROM &quot;L4_MEASUREMENT&quot;" UpdateCommand="UPDATE &quot;L4_MEASUREMENT&quot; SET &quot;DESCIPTION&quot; = ? WHERE &quot;MEASUREMENTID&quot; = ? AND &quot;DESCIPTION&quot; = ?">
                        <DeleteParameters>
                            <asp:Parameter Name="original_MEASUREMENTID" Type="Decimal" />
                            <asp:Parameter Name="original_DESCIPTION" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="MEASUREMENTID" Type="Decimal" />
                            <asp:Parameter Name="DESCIPTION" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="DESCIPTION" Type="String" />
                            <asp:Parameter Name="original_MEASUREMENTID" Type="Decimal" />
                            <asp:Parameter Name="original_DESCIPTION" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("desciption") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
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
</asp:Content>

