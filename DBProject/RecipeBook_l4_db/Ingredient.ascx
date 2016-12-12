<%@ Control Language="C#" ClassName="Ingredient" %>

<script runat="server">    
public string IngNameText
    {
        get
        {
            return txtIngName.Text;
        }
        set
        {
            txtIngName.Text = value;
        }
    }

    public string IngQtyText
    {
        get
        {
            return txtIngQty.Text;
        }
        set
        {
            txtIngQty.Text = value;
        }
    }

    public string UnitText
    {
        get
        {
            return txtUnit.Text;
        }
        set
        {
            txtUnit.Text = value;
        }
    }


    protected void lkbtn_delet_Click(object sender, EventArgs e)
    {
        this.Parent.Controls.Remove(this);
    }

</script>

<p><asp:Label ID="lblIngredientName" runat="server" Text="Name of Ingredient: "></asp:Label><asp:DropDownList ID="txtIngName" runat="server" DataSourceID="SqlDataSource1" DataTextField="INGREDIENTNAME" DataValueField="INGREDIENTID"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT &quot;INGREDIENTID&quot;, &quot;INGREDIENTNAME&quot; FROM &quot;L4_INGREDIENTS&quot;"></asp:SqlDataSource>
    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblQuantity" runat="server" Text="Quantity: "></asp:Label><asp:TextBox ID="txtIngQty" runat="server" Width="30"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblUnit" runat="server" Text="Unit of Measure: "></asp:Label><asp:DropDownList ID="txtUnit" runat="server" Width="100px" DataSourceID="SqlDataSource2" DataTextField="DESCIPTION" DataValueField="MEASUREMENTID"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT &quot;MEASUREMENTID&quot;, &quot;DESCIPTION&quot; FROM &quot;L4_MEASUREMENT&quot;"></asp:SqlDataSource><br />
<asp:RequiredFieldValidator ID="IngNameReq" runat="server" ControlToValidate="txtIngName" Display="Dynamic" ErrorMessage="* Ingredient name is required!" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:RequiredFieldValidator ID="QtyReq" runat="server" ControlToValidate="txtIngQty" Display="Dynamic" ErrorMessage=" * Quantity of ingredient is required!" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:CompareValidator ID="QtyCheck" runat="server" ErrorMessage="* Quantity must be number!" ControlToValidate="txtIngQty" ForeColor="Red" Display="Dynamic" Type="Double"></asp:CompareValidator>   
</p>
