<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="taksittablosu.aspx.cs" Inherits="GedizMakina.taksittablosu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <style>
                #paytr_taksit_tablosu {
                    clear: both;
                    font-size: 12px;
                    max-width: 1200px;
                    text-align: center;
                    font-family: Arial, sans-serif;
                }

                    #paytr_taksit_tablosu::before {
                        display: table;
                        content: " ";
                    }

                    #paytr_taksit_tablosu::after {
                        content: "";
                        clear: both;
                        display: table;
                    }

                .taksit-tablosu-wrapper {
                    margin: 5px;
                    width: 280px;
                    padding: 12px;
                    cursor: default;
                    text-align: center;
                    display: inline-block;
                    border: 1px solid #e1e1e1;
                }

                .taksit-logo img {
                    max-height: 28px;
                    padding-bottom: 10px;
                }

                .taksit-tutari-text {
                    float: left;
                    width: 126px;
                    color: #a2a2a2;
                    margin-bottom: 5px;
                }

                .taksit-tutar-wrapper {
                    display: inline-block;
                    background-color: #f7f7f7;
                }

                    .taksit-tutar-wrapper:hover {
                        background-color: #e8e8e8;
                    }

                .taksit-tutari {
                    float: left;
                    width: 126px;
                    padding: 6px 0;
                    color: #474747;
                    border: 2px solid #ffffff;
                }

                .taksit-tutari-bold {
                    font-weight: bold;
                }

                @media all and (max-width: 600px) {
                    .taksit-tablosu-wrapper {
                        margin: 5px 0;
                    }
                }
            </style>
            <div id="paytr_taksit_tablosu"></div>
            <script src="https://www.paytr.com/odeme/taksit-tablosu/v2?token=71c73f6303049ae3e7df650d6614bd16fe94fd5ba751c31e952f8d2f04cf40ee&merchant_id=496818&amount=113"></script>
        </div>
    </form>
</body>
</html>
