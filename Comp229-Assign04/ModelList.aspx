<%@ Page Title="Model List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModelList.aspx.cs" Inherits="Comp229_Assign04._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="col-xs-12 col-md-4 divBody">
            <table>
             <tr>
                 <td>Name:</td>
                 <td>Faction:</td>
             </tr>
    <asp:Repeater runat="server" ID="modelListRepeater">
        <ItemTemplate>
            <tr>
                <td>
            <asp:hyperlink runat="server" NavigateUrl='<%#string.Format("~/ModelView.aspx?name={0}&faction={1}", Eval("name"), Eval("faction"))%>' Text='<%# Eval("name") %>'/>
                </td>
                <td>
            <asp:Label runat="server" Text='<%#Eval("faction") %>'></asp:Label>
                </td>
            </tr>
            
        </ItemTemplate>
    </asp:Repeater>
                 </table>
        </div>
        <div class="col-md-4 col-xs-12 divColor">
            Create a new file:
            <asp:button CssClass="btn" runat="server" ID="saveNewJsonFile" OnClick="saveNewJsonFile_Click" Text="Create File" /><br />
            <asp:Label runat="server" ID="fileCreationConfirmation"></asp:Label>
            </div>
        <div class="col-md-4 col-xs-12 divColor">
            Send a update of the file for yourself:<br />
            Name:<asp:TextBox runat="server" ID="nameTB"></asp:TextBox><br />
            To:<asp:TextBox runat="server" ID="fromMailAddressTB"></asp:TextBox><br /><br />
            <asp:Button CssClass="btn" runat="server" ID="sendMailButton" OnClick="sendMailButton_Click" Text="Send Mail" /><br />
            <asp:label runat="server" ID="mailConfirmation"></asp:label>
        </div>
        <div class="col-md-4 col-xs-12 divColor">
            Create a new character:<br />
            Name: <asp:TextBox runat="server" ID="createNameTB"></asp:TextBox><br />
            Faction: <asp:TextBox runat="server" ID="createfactionTB"></asp:TextBox><br /><br />
            <asp:Button CssClass="btn" runat="server" ID="createCharacter" OnClick="createCharacter_Click" Text="Create Character!" /><br />
        </div>
    
</asp:Content>
