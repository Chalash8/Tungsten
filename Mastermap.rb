require "csv"


def get_req_field_hash
  all_fields = ["InvoiceNumber", "InvoiceDate", "Tax Point Date", "InvoiceType", "BuyerID", "Original Invoice Number", "Original Invoice Date", "Original Delivery Date", "Credit Reason", "PO Number", "Delivery Note Number", "PaymentReference", "PaymentMethod", "FormOfPayment", "Payment Terms", "NetPaymentDays", "Start Date", "End Date", "Order Date", "Delivery Date", "ShipDate", "Declaration Date", "Payment Due By Date", "Early Payment Date", "ManufactureDate", "ExpiryDate", "InvFromName", "InvFromAdd1", "InvFromAdd2", "InvFromCity", "InvFromPostalCode", "InvFromState", "InvFromCountry", "Supplier QST Tax. Reg. Num.", "Supplier PST Tax. Reg. Num.", "Supplier GST Tax. Reg. Num.", "Supplier HST Tax. Reg. Num.", "Main Supplier Contact Name", "Main Supplier Contact Tel", "Main Supplier Contact Email", "ContactNameForInvQ", "ContactTelForInvQ", "ContactEmailForInvQ", "InvToName", "InvToAdd1", "InvToAdd2", "InvToCity", "InvToPostalCode", "InvToState", "InvToCountry", "BuyerContactName", "BuyerContactTel", "BuyerContactEmail", "SupplierFiscRepName", "SupplierFiscRepAdd1", "SupplierFiscRepAdd2", "SupplierFiscRepCity", "SupplierFiscRepPostalCode", "SupplierFiscRepState", "SupplierFiscRepCountry", "SupplierFiscRepTaxRegNum", "ShipToName", "ShipToAdd1", "ShipToAdd2", "ShipToCity", "ShipToPostalCode", "ShipToState", "ShipToCountry", "ShipToTaxRegNum", "ShipFromName", "ShipFromAdd1", "ShipFromAdd2", "ShipFromCity", "ShipFromPostalCode", "ShipFromState", "ShipFromCountry", "ShipFromTaxRegNum", "OrderedByName", "OrderedByAdd1", "OrderedByAdd2", "OrderedByCity", "OrderedByPostalCode", "OrderedByState", "OrderedByCountry", "InvoiceNetAmount", "InvoiceTaxAmount", "InvoiceGrossAmount", "Currency", "LocalCurrency", "ExchangeRate", "LocalCurrencyNet", "LocalCurrencyTax", "LocalCurrencyGross", "Bank Name", "Bank Address", "Sort Code", "Bank Account Number", "Bank Account Name", "IBAN", "SWIFT", "POLineNum", "Quantity", "UnitOfMeasure", "UnitPrice", "LineNetAmount", "SupplierPartNum", "SupplierPartDescr", "BuyerPartNum", "ManufacturerPartNum", "CommodityCode", "TaxDescriptor", "TaxCategoryCode1", "TaxRate1", "TaxAmount1", "TaxCategoryCode2", "TaxRate2", "TaxAmount2", "TaxCategoryCode3", "TaxRate3", "TaxAmount3", "TaxCategoryCode4", "TaxRate4", "TaxAmount4", "ShipmentNum", "BuyerCostCenter", "BillOfLading", "ContractID", "DUNSNumber", "INCOTerms", "WBS", "NatureOfTax", "PlaceOfIsuue", "GLNumber", "AccountNumber", "UtilityID", "ESRRef", "ESRNum", "Weight", "NetWeight", "GrossWeight", "NumberOfPacks", "ModeOfTransport", "ExpectedTimeOfArrival", "PortOfLoading", "PortOfDischarge", "ChargeCategory", "WithholdingTaxIndicator", "LicenseNum", "CustomsDeclNum", "CustomsDeclOffice", "CountryOfOrigin", "RailTruckNumber", "BatchNumber", "BatchQuantity", "GoodsOrServiceIndicator", "Month", "Week", "Hours", "Name", "LocationCode", "ApproverCode", "Serial Number", "Buyer Affiliate", "Export Number", "Ticket Number", "TaxRegime", "Discount Description", "Discount Amount", "Discount Tax Category 1", "Discount Tax Rate 1", "Discount Tax Amount 1", "Discount Tax Category 2", "Discount Tax Rate 2", "Discount Tax Amount 2", "Discount Tax Category 3", "Discount Tax Rate 3", "Discount Tax Amount 3", "Discount Tax Category 4", "Discount Tax Rate 4", "Discount Tax Amount 4", "Special Charge Description", "Special Charge Amount", "Special Charge Tax Category 1", "Special Charge Tax Rate 1", "Special Charge Tax Amount 1", "Special Charge Tax Category 2", "Special Charge Tax Rate 2", "Special Charge Tax Amount 2", "Special Charge Tax Category 3", "Special Charge Tax Rate 3", "Special Charge Tax Amount 3", "Special Charge Tax Category 4", "Special Charge Tax Rate 4", "Special Charge Tax Amount 4", "Carriage Description", "Carriage Amount", "Carriage Tax Category 1", "Carriage Tax Rate 1", "Carriage Tax Amount 1", "Carriage Tax Category 2", "Carriage Tax Rate 2", "Carriage Tax Amount 2", "Carriage Tax Category 3", "Carriage Tax Rate 3", "Carriage Tax Amount 3", "Carriage Tax Category 4", "Carriage Tax Rate 4", "Carriage Tax Amount 4", "Freight Description", "Freight Amount", "Freight Tax Category 1", "Freight Tax Rate 1", "Freight Tax Amount 1", "Freight Tax Category 2", "Freight Tax Rate 2", "Freight Tax Amount 2", "Freight Tax Category 3", "Freight Tax Rate 3", "Freight Tax Amount 3", "Freight Tax Category 4", "Freight Tax Rate 4", "Freight Tax Amount 4", "Insurance Description", "Insurance Amount", "Insurance Tax Category 1", "Insurance Tax Rate 1", "Insurance Tax Amount 1", "Insurance Tax Category 2", "Insurance Tax Rate 2", "Insurance Tax Amount 2", "Insurance Tax Category 3", "Insurance Tax Rate 3", "Insurance Tax Amount 3", "Insurance Tax Category 4", "Insurance Tax Rate 4", "Insurance Tax Amount 4", "Packing Description", "Packing Amount", "Packing Tax Category 1", "Packing Tax Rate 1", "Packing Tax Amount 1", "Packing Tax Category 2", "Packing Tax Rate 2", "Packing Tax Amount 2", "Packing Tax Category 3", "Packing Tax Rate 3", "Packing Tax Amount 3", "Packing Tax Category 4", "Packing Tax Rate 4", "Packing Tax Amount 4", "Admin Charge Description", "Admin Charge Amount", "Admin Charge Tax Category 1", "Admin Charge Tax Rate 1", "Admin Charge Tax Amount 1", "Admin Charge Tax Category 2", "Admin Charge Tax Rate 2", "Admin Charge Tax Amount 2", "Admin Charge Tax Category 3", "Admin Charge Tax Rate 3", "Admin Charge Tax Amount 3", "Admin Charge Tax Category 4", "Admin Charge Tax Rate 4", "Admin Charge Tax Amount 4", "Fuel Surcharge Description", "Fuel Surcharge Amount", "Fuel Surcharge Tax Category 1", "Fuel Surcharge Tax Rate 1", "Fuel Surcharge Tax Amount 1", "Fuel Surcharge Tax Category 2", "Fuel Surcharge Tax Rate 2", "Fuel Surcharge Tax Amount 2", "Fuel Surcharge Tax Category 3", "Fuel Surcharge Tax Rate 3", "Fuel Surcharge Tax Amount 3", "Fuel Surcharge Tax Category 4", "Fuel Surcharge Tax Rate 4", "Fuel Surcharge Tax Amount 4", "Green Tax Description", "Green Tax Amount", "Green Tax Tax Category 1", "Green Tax Tax Rate 1", "Green Tax Tax Amount 1", "Green Tax Tax Category 2", "Green Tax Tax Rate 2", "Green Tax Tax Amount 2", "Green Tax Tax Category 3", "Green Tax Tax Rate 3", "Green Tax Tax Amount 3", "Green Tax Tax Category 4", "Green Tax Tax Rate 4", "Green Tax Tax Amount 4", "Rounding Line Description", "Rounding Line Amount", "Rounding Line Tax Category 1", "Rounding Line Tax Rate 1", "Rounding Line Tax Amount 1", "Rounding Line Tax Category 2", "Rounding Line Tax Rate 2", "Rounding Line Tax Amount 2", "Rounding Line Tax Category 3", "Rounding Line Tax Rate 3", "Rounding Line Tax Amount 3", "Rounding Line Tax Category 4", "Rounding Line Tax Rate 4", "Rounding Line Tax Amount 4", "Demurrage Description", "Demurrage Amount", "Demurrage Tax Category 1", "Demurrage Tax Rate 1", "Demurrage Tax Amount 1", "Demurrage Tax Category 2", "Demurrage Tax Rate 2", "Demurrage Tax Amount 2", "Demurrage Tax Category 3", "Demurrage Tax Rate 3", "Demurrage Tax Amount 3", "Demurrage Tax Category 4", "Demurrage Tax Rate 4", "Demurrage Tax Amount 4", "Invoice Detail1", "Invoice Detail2", "Invoice Detail3", "Discount Percent Line", "Discount Amount Line", "SupplierID", "Invoice From Tax Registration Number", "Invoice To Tax Registration Number", "Third Party Delivery Ticket Number", "Delivery tax registration number", "Endorsement", "Input tax credit", "Payable tax on a reverse charge basis", "ISD number", "Advanced payment amount", "PartyNumber", "PECE-mail", "NaturalPersonName", "NaturalPersonSurname", "RepresentativeIdentificationNumber", "SupplierOrderNumber", "RemitToName", "RemitToStreet1", "RemitToStreet2", "RemitToCity", "RemitToState", "RemitToPostalCode", "RemitToCountry"]

  # conditional Line Net Amount(with no discount),Tax Amount,Discount Amount, Discount Percent,Bill of lading, Tax Rate, Tax Amount, Line type - normal line ites, special charges or discount

  req_fields = ["InvoiceNumber", "InvoiceDate","InvoiceType", "BuyerID", "Currency", "Quantity", "PO Number", "UnitPrice", "UnitOfMeasure", "ShipFromName", "LineNetAmount", "ShipFromAdd1", "ShipFromCity", "ShipFromPostalCode", "ShipFromState", "ShipFromCountry", "ShipFromTaxRegNum", "ShipToName", "ShipToAdd1", "ShipToCity", "ShipToPostalCode", "SupplierPartDescr", "ShipToState", "ShipToCountry", "ShipToTaxRegNum", "InvoiceTaxAmount", "BuyerPartNum", "InvoiceNetAmount", "InvoiceGrossAmount", "TaxRate1", "TaxAmount1", "RemitToName", "RemitToStreet1", "RemitToCity", "RemitToState", "RemitToPostalCode", "RemitToCountry"]



  hash1 = Hash[all_fields.map {|x| [x, ]}]
  hash2 = Hash[req_fields.map {|x| [x,x]}]

  hash1.merge!(hash2)


  #hash1['LineNetAmount'] = hash2['Quantity'] * hash2['UnitPrice']

  return hash1
end

def change_key_names()
  data = CSV.foreach('export.csv', headers: true).map{ |row| row.to_h }
  hash = get_req_field_hash()
  data.each do |row|
    row["InvoiceNumber"] = row.delete("Expense Sheet ID")
    row = row.select{|x| hash.keys.include?(x)}
  end
end





data = change_key_names()



CSV.open('test.csv', 'w', {:col_sep=>'|'}) do |csv_object|
  hash = get_req_field_hash()
  data.each do |row|
    hash.merge!(row)
    csv_object << hash.values
  end
end
