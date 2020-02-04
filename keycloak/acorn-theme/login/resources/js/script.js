window.onload = () => {
  const dev = window.localStorage.getItem("dev");
  const elem = document.getElementById("zocial-saml");
  var redirected = false;
  const params = new URL(document.URL).searchParams;
  const nonce = params.get("nonce");

  const verifyNonce = () => {
    // This cookie can change
    nonce_prefix = document.cookie.replace(
      /(?:(?:^|.*;\s*)nonce_prefix\s*\=\s*([^;]*).*$)|^.*$/,
      "$1"
    );

    if (!redirected && (!nonce_prefix || !nonce.startsWith(nonce_prefix))) {
      // Redirect back to fetch a new nonce
      uri = new URL(params.get("redirect_uri"));
      uri.searchParams.set("state", params.get("state"));
      uri.searchParams.set("nonce_changed", "true");
      window.location.replace(uri);
      redirected = true;
    }
  };

  if (params.get("client_id") === "flask" && nonce) {
    // Periodically verify the nonce has not been invalidated
    verifyNonce();
    window.setInterval(verifyNonce, 100);
  }

  if (dev || !elem) return;

  //Disabling auto-redirection for now since some of our stacks have multiple SSO
  //window.location.href = elem.href
};
