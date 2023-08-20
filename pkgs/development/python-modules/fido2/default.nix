{ lib
, buildPythonPackage
, fetchPypi
, poetry-core
, six
, cryptography
, mock
, pyfakefs
, unittestCheckHook
}:

buildPythonPackage rec {
  pname = "fido2";
  version = "1.1.2";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-YRDZExBvdhmSAbMtJisoV1YsxGuh0LnFH7zjDck2xXM=";
  };

  nativeBuildInputs = [ poetry-core ];

  propagatedBuildInputs = [ six cryptography ];

  nativeCheckInputs = [ unittestCheckHook mock pyfakefs ];

  unittestFlagsArray = [ "-v" ];

  pythonImportsCheck = [ "fido2" ];

  meta = with lib; {
    description = "Provides library functionality for FIDO 2.0, including communication with a device over USB.";
    homepage = "https://github.com/Yubico/python-fido2";
    changelog = "https://github.com/Yubico/python-fido2/releases/tag/${version}";
    license = licenses.bsd2;
    maintainers = with maintainers; [ prusnak ];
  };
}
