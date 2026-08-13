UPDATE data_sheets
SET external_url = 'https://www.fullcompass.com/common/files/20193-PIEngineeringXKeysUSBSwitchInterfaceManual.pdf',
    file_name = 'PI Engineering XK-12 USB Switch Interface Manual.pdf',
    notes = 'X-keys USB Switch Interface manual and specifications'
WHERE item_id = (SELECT id FROM items WHERE part_number = 'XK-1202-UHS12-R')
  AND storage_key = '';
