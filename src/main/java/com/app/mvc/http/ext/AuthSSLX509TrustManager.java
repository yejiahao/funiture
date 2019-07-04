package com.app.mvc.http.ext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.net.ssl.X509TrustManager;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Objects;

public class AuthSSLX509TrustManager implements X509TrustManager {

    private X509TrustManager defaultTrustManager;

    /**
     * Log object for this class.
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(AuthSSLX509TrustManager.class);

    /**
     * Constructor for AuthSSLX509TrustManager.
     */
    public AuthSSLX509TrustManager(final X509TrustManager defaultTrustManager) {
        super();
        if (Objects.isNull(defaultTrustManager)) {
            throw new IllegalArgumentException("Trust manager may not be null");
        }
        this.defaultTrustManager = defaultTrustManager;
    }

    @Override
    public void checkClientTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException {
        if (LOGGER.isInfoEnabled() && Objects.nonNull(x509Certificates)) {
            for (int c = 0; c < x509Certificates.length; c++) {
                X509Certificate cert = x509Certificates[c];
                LOGGER.info(" Client certificate " + (c + 1) + ":");
                LOGGER.info("  Subject DN: " + cert.getSubjectDN());
                LOGGER.info("  Signature Algorithm: " + cert.getSigAlgName());
                LOGGER.info("  Valid from: " + cert.getNotBefore());
                LOGGER.info("  Valid until: " + cert.getNotAfter());
                LOGGER.info("  Issuer: " + cert.getIssuerDN());
            }
        }
        this.defaultTrustManager.checkServerTrusted(x509Certificates, s);
    }

    @Override
    public void checkServerTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException {
        if (LOGGER.isInfoEnabled() && Objects.nonNull(x509Certificates)) {
            for (int c = 0; c < x509Certificates.length; c++) {
                X509Certificate cert = x509Certificates[c];
                LOGGER.info("  Server certificate " + (c + 1) + ":");
                LOGGER.info("  Subject DN: " + cert.getSubjectDN());
                LOGGER.info("  Signature Algorithm: " + cert.getSigAlgName());
                LOGGER.info("  Valid from: " + cert.getNotBefore());
                LOGGER.info("  Valid until: " + cert.getNotAfter());
                LOGGER.info("  Issuer: " + cert.getIssuerDN());
            }
        }
        this.defaultTrustManager.checkServerTrusted(x509Certificates, s);
    }

    @Override
    public X509Certificate[] getAcceptedIssuers() {
        return defaultTrustManager.getAcceptedIssuers();
    }

}