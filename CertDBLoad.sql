SELECT        dbo.t_cert_header.CUST_STO_LN1_NAME, dbo.t_cert_header.CRET_DATE, dbo.t_cert_header.LAST_UPDT_DATE, dbo.t_cert_header.ultimate_supply_location, dbo.t_cert_detail.Load_ID, dbo.t_cert_detail.MFG_DATE, 
                         dbo.t_cert.FIN_SHIP_DATE, dbo.t_cert.INVOICE_NUMBER, dbo.t_cert.ITEM_DESC, dbo.t_cert.LOC_NAME, dbo.t_cert.MMM_ID_NBR, dbo.t_cert.SHPF_ORTG_FCLT_CD, dbo.t_cert_header.TRNS_STUS_CODE
FROM            dbo.t_cert_header INNER JOIN
                         dbo.t_cert_detail ON dbo.t_cert_header.Cert_Header_ID = dbo.t_cert_detail.Cert_Header_ID INNER JOIN
                         dbo.t_cert ON dbo.t_cert_header.cert_id = dbo.t_cert.CERT_ID
WHERE        (dbo.t_cert_header.CRET_DATE > GETDATE() - 2) AND (dbo.t_cert_header.ultimate_supply_location = 'FHP') AND (dbo.t_cert.INVOICE_NUMBER IS NOT NULL) OR
                         (dbo.t_cert_header.ultimate_supply_location = 'FHP') AND (dbo.t_cert.INVOICE_NUMBER IS NOT NULL) AND (dbo.t_cert_header.LAST_UPDT_DATE > GETDATE() - 2)