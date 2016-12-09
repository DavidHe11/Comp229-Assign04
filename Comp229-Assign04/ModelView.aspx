<%@ Page Title="Model View" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="ModelView.aspx.cs" Inherits="Comp229_Assign04.ModelView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-xs-12 col-md-4">
        <div class="col-xs-12 col-md-4 leftFloat">
        <asp:Image runat="server" ID="figureImage" Width="200px" />
            </div>
        <div class="col-xs-12 col-md-4 rightFloat">
            <table>
                <tr>
                    <td>Name:</td>
                    <td><asp:Label ID="nameLbl" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Faction:</td>
                    <td><asp:Label ID="factionLbl" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Rank:</td>
                    <td><asp:Label ID="RankLbl" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Base:</td>
                    <td><asp:Label ID="baseLbl" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Size</td>
                    <td><asp:Label ID="sizeLbl" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Deployment Zone:</td>
                    <td><asp:Label ID="deploymentLbl" runat="server"></asp:Label></td>
                </tr>
                <tr>
                <td>Traits:</td>
                <asp:repeater ID="traitsRepeater" runat="server">
                    <ItemTemplate>

                <td><asp:Label runat="server" Text="<%#Container.DataItem.ToString() %>"></asp:Label></td>
                    </ItemTemplate></asp:repeater>
                </tr>
                <tr>
                <td>Type:</td>
                <asp:repeater ID="typeRepeater" runat="server">
                    <ItemTemplate>
                <td><asp:Label runat="server" Text="<%# Container.DataItem.ToString() %>"></asp:Label></td>
                    </ItemTemplate>
                </asp:repeater>
                </tr>
                <tr>
                <td>Defence:</td>
                </tr>
                <asp:repeater ID="defenceRepeater" runat="server">
                    <ItemTemplate>
                        <tr><td>&nbsp;</td>
                <td><asp:Label runat="server" Text="<%# (10 - Container.ItemIndex) %>"></asp:Label></td>
                <td><asp:Label runat="server" Text="<%# Container.DataItem.ToString() %>"></asp:Label></td>
                        </tr>
                    </ItemTemplate>
                </asp:repeater>
                <tr><td>&nbsp;</td></tr>
                <tr>
                    <td>Mobility:</td>
                    <td><asp:Label ID="mobilityLbl" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Willpower:</td>
                    <td><asp:Label ID="willpowerLbl" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Resiliance:</td>
                    <td><asp:Label ID="resilianceLbl" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Wounds:</td>
                    <td><asp:Label ID="woundsLbl" runat="server"></asp:Label></td>
                </tr>
                <tr>
                <td>Actions:</td>
                <asp:repeater ID="actionsRepeater" runat="server">
                    <ItemTemplate>
                        <tr><td>&nbsp;</td></tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>Name:</td>
                    <td><asp:Label runat="server" Text='<%# Eval("name") %>'></asp:Label></td>
                </tr>        
                <tr><td>&nbsp;</td>
                    <td>Type:</td>
                    <td><asp:Label runat="server" Text='<%# Eval("type") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>Rating:</td>
                    <td><asp:Label runat="server" Text='<%# Eval("rating") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>Range:</td>
                    <td><asp:Label runat="server" Text='<%# Eval("range") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>Description:</td>
                    <td><asp:Label runat="server" Text='<%# Eval("description") %>'></asp:Label></td>
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
                    <td><asp:Label runat="server" Text='<%# Eval("name") %>'></asp:Label></td>
                    <tr><td>&nbsp;</td></tr>
                </tr> 
                <tr>
                    <td>&nbsp;</td>
                    <td>Description:</td>
                    <td><asp:Label runat="server" Text='<%# Eval("description") %>'></asp:Label></td>
                    <tr><td>&nbsp;</td></tr>
                </tr>               
                    </ItemTemplate>
                </asp:repeater>
                </tr>

            </table>
            </div>

    </div>
</asp:Content>
