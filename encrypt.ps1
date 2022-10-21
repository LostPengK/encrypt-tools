$folder_exist=(Test-Path ebunker)
$pubkey_exist=(Test-Path ebunker-public-key.gpg)


if("$folder_exist" -eq "$False")
{
echo "����ebunker�ļ��в����ڣ��봴��ebunker�ļ��У�������keystore�ļ��������ı������Ѵ����������ļ�������Ϊebunker"
echo "�ο��ĵ���https://docs.ebunker.io/docs/keystore"
pause
exit

}

if("$pubkey_exist" -eq "$False")
{
echo "���󣺼��ܹ�Կδ�ҵ�������ʼ������ظ��� ebunker-public-key.gpg������"
echo "�������أ������ļ�����Ϊebunker-public-key.gpg"
echo "�ο��ĵ���https://docs.ebunker.io/docs/keystore"
pause
exit

}

$timestamp=Get-Date -Format 'yyyyMMddHHmmss'
powershell Compress-Archive -Path ebunker -DestinationPath "ebunker-keystore_$timestamp.zip"
gpg --import ebunker-public-key.gpg
gpg --recipient ebunker --output "ebunker-keystore_$timestamp.gpg" --encrypt "ebunker-keystore_$timestamp.zip"

echo "�ļ������ɣ��ļ��� ebunker-keystore_$timestamp.gpg ��λ�ã�����"
echo "��������˳�"
pause

exit