<%@ Page Title="Update Page" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="UpdatePage.aspx.cs" Inherits="Comp229_Assign04.UpdatePage" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-xs-12 col-md-4 divBody">
        <div class="col-xs-12 col-md-4 leftFloat">
        <asp:Image runat="server" ID="figureImage" Width="200px" />
            <asp:Button CssClass="btn" runat="server" ID="updateConfirm" OnClick="updateConfirm_Click" Text=" Confirm Update" /><br /><br /><br />
            <asp:Button CssClass="btn" runat="server" ID="cancelConfirm" OnClick="cancelConfirm_Click" Text="Cancel Update" />
            </div>
        <div class="col-xs-12 col-md-4 rightFloat">
            <table>
                <tr>
                    <td>Name:</td>
                    <td><asp:Textbox ID="nameTB" runat="server"></asp:Textbox></td>
                </tr>
                <tr>
                    <td>Faction:</td>
                    <td><asp:Textbox ID="factionTB" runat="server"></asp:Textbox></td>
                </tr>
                <tr>
                    <td>Rank:</td>
                    <td><asp:Textbox ID="RankTB" runat="server"></asp:Textbox></td>
                </tr>
                <tr>
                    <td>Base:</td>
                    <td><asp:Textbox ID="baseTB" runat="server"></asp:Textbox></td>
                </tr>
                <tr>
                    <td>Size</td>
                    <td><asp:Textbox ID="sizeTB" runat="server"></asp:Textbox> mm</td>
                </tr>
                <tr>
                    <td>Deployment Zone:</td>
                    <td><asp:Textbox ID="deploymentTB" runat="server"></asp:Textbox></td>
                </tr>
                <tr>
                <td>Traits:</td>
                <asp:repeater ID="traitsRepeater" runat="server">
                    <ItemTemplate>

                <td><asp:Textbox ID="traitsTB" runat="server" Text="<%#Container.DataItem.ToString() %>"></asp:Textbox></td>
                    </ItemTemplate></asp:repeater>
                </tr>
                <tr>
                <td>Type:</td>
                <asp:repeater ID="typeRepeater" runat="server">
                    <ItemTemplate>
                <td><asp:Textbox ID="typeTB" runat="server" Text="<%# Container.DataItem.ToString() %>"></asp:Textbox></td>
                    </ItemTemplate>
                </asp:repeater>
                </tr>
                <tr>
                <td>Defence:</td>
                </tr>
                <asp:repeater ID="defenceRepeater" runat="server">
                    <ItemTemplate>
                        <tr><td>&nbsp;</td>
                <td><asp:Textbox ID="defencenumbersTB" runat="server" Text="<%# (10 - Container.ItemIndex) %>"></asp:Textbox></td>
                <td><asp:Textbox ID="defencewordsTB" runat="server" Text="<%# Container.DataItem.ToString() %>"></asp:Textbox></td>
                        </tr>
                    </ItemTemplate>
                </asp:repeater>
                <tr><td>&nbsp;</td></tr>
                <tr>
                    <td>Mobility:</td>
                    <td><asp:Textbox ID="mobilityTB" runat="server"></asp:Textbox></td>
                </tr>
                <tr>
                    <td>Willpower:</td>
                    <td><asp:Textbox ID="willpowerTB" runat="server"></asp:Textbox></td>
                </tr>
                <tr>
                    <td>Resiliance:</td>
                    <td><asp:Textbox ID="resilianceTB" runat="server"></asp:Textbox></td>
                </tr>
                <tr>
                    <td>Wounds:</td>
                    <td><asp:Textbox ID="woundsTB" runat="server"></asp:Textbox></td>
                </tr>
                <tr>
                <td>Actions:</td>
                <asp:repeater ID="actionsRepeater" runat="server">
                    <ItemTemplate>
                        <tr><td>&nbsp;</td></tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>Name:</td>
                    <td><asp:Textbox ID="actionName" runat="server" Text='<%# Eval("name") %>'></asp:Textbox></td>
                </tr>        
                <tr><td>&nbsp;</td>
                    <td>Type:</td>
                    <td><asp:Textbox ID="actionType" runat="server" Text='<%# Eval("type") %>'></asp:Textbox></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>Rating:</td>
                    <td><asp:Textbox ID="actionRating" runat="server" Text='<%# Eval("rating") %>'></asp:Textbox></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>Range:</td>
                    <td><asp:Textbox ID="actionRange" runat="server" Text='<%# Eval("range") %>'></asp:Textbox></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>Description:</td>
                    <td><asp:Textbox ID="actionDesc" runat="server" Text='<%# Eval("description") %>'></asp:Textbox></td>
                </tr>
                    </ItemTemplate>
                </asp:repeater>
                </tr>
                <tr><td>&nbsp;</td></tr>
                <tr>
                <td>Special Abilities:</td>
                <asp:repeater ID="specialAbilitiesRepeater" runat="server">
                    <ItemTemplate>
                <tr>
                    <td>&nbsp;</td>
                    <td>Name:</td>
                    <td><asp:Textbox ID="specialName" runat="server" Text='<%# Eval("name") %>'></asp:Textbox></td>
                    <tr><td>&nbsp;</td></tr>
                </tr> 
                <tr>
                    <td>&nbsp;</td>
                    <td>Description:</td>
                    <td><asp:Textbox ID="specialDesc" runat="server" Text='<%# Eval("description") %>'></asp:Textbox></td>
                    <tr><td>&nbsp;</td></tr>
                </tr>               
                    </ItemTemplate>
                </asp:repeater>
                </tr>

            </table>
            </div>

    </div>
</asp:Content>
