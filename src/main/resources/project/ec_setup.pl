my %RunSalt = (
    label       => "Salt - Remote Task",
    procedure   => "RunSalt",
    description => "Run the salt utility.",
    category    => "Resource Management"
);

my %SaltFileTransfer = (
    label       => "Salt - File Transfer",
    procedure   => "SaltFileTransfer",
    description => "Copies a file from a machine to n machines with a single command.",
    category    => "Resource Management"
);

my %AuthenticationManagement = (
    label       => "Salt - Authentication Management",
    procedure   => "AuthenticationManagement",
    description => "Manages public keys used for authentication.",
    category    => "Resource Management"
);

$batch->deleteProperty("/server/ec_customEditors/pickerStep/EC-Salt - RunSalt");
$batch->deleteProperty("/server/ec_customEditors/pickerStep/EC-Salt - SaltFileTransfer");
$batch->deleteProperty("/server/ec_customEditors/pickerStep/EC-Salt - AuthenticationManagement");
$batch->deleteProperty("/server/ec_customEditors/pickerStep/Salt - Remote Task");
$batch->deleteProperty("/server/ec_customEditors/pickerStep/Salt - File Transfer");
$batch->deleteProperty("/server/ec_customEditors/pickerStep/Salt - Authentication Management");

@::createStepPickerSteps = (\%RunSalt, \%SaltFileTransfer, \%AuthenticationManagement);
