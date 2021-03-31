Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 025C934E8CC
	for <lists+kernel-janitors@lfdr.de>; Tue, 30 Mar 2021 15:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbhC3NRe (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 30 Mar 2021 09:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232220AbhC3NRP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 30 Mar 2021 09:17:15 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 053E1C061762
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Mar 2021 06:17:14 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id a143so17384311ybg.7
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Mar 2021 06:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uGggNmCKA1f9bQAomVhKatedboRVhdvWl20Yl4lUhRg=;
        b=FQkhTBgDYnsBGYQD/HhFAap4oLPBkRrxv+mjqs6VzbZ1rflV18RiKOhSk9VISnu7wS
         qzbshEvIHwfKi0FYewDGZceRS3f+2cDVlYh6dW2V5Nd6dAWJdXFq4roeNtzFC42Qk7Gx
         OFyDGk9n63Wb3rirqq62OazT6LHiLbqYNbkvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uGggNmCKA1f9bQAomVhKatedboRVhdvWl20Yl4lUhRg=;
        b=bCwyLvhzeETDGZGEYpZnZH+cy2TPBZxWrMUa0N/O1osJRZ3/Zppia3iaHhHKkdajTG
         aVIAaVJYLFSISlwBC4YQvdLehF98BJqyhNMc4xDCCrE6JARWzgPxp+1S2va+1aDoTcH+
         e0i+TNrwXYg/ExUS8HFikor96IL0NyNZKLoLOWmmhYtb6yqeAA67i40cSaFHMmO+GYKj
         TKredcrZThsdodgE3nMIaCfiysuOlR4EplTD9u80xl5ZQWaJo8p5PxCouFW6+Sw2r0b9
         4Kx5ZonmJUEv2PRzkeoLRKC0j7ou7ehBpNqSdRTq9p7BVX9xDY7W6ff8x92YBUOFoENA
         6kPw==
X-Gm-Message-State: AOAM532Q4EGPJjPygl0LmZ7Gvb26OrR2yQJPsktjdkI6eJ/NkIM6JsZT
        6cFmaZIxPNWzIu9aHyNnx+ads5i04Iuua6JDpMli
X-Google-Smtp-Source: ABdhPJy2XdI4h+z2hSzBhFtOL24JYQtzPPQ4A8CYASLflvu69RGW+Po97aGLXmV9Aonv5dnF935nycSrkmBWYY8Ta4I=
X-Received: by 2002:a25:2313:: with SMTP id j19mr45116813ybj.87.1617110234101;
 Tue, 30 Mar 2021 06:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210329140659.1832950-1-weiyongjun1@huawei.com>
In-Reply-To: <20210329140659.1832950-1-weiyongjun1@huawei.com>
From:   Al Cooper <al.cooper@broadcom.com>
Date:   Tue, 30 Mar 2021 09:17:02 -0400
Message-ID: <CAGh=XAAF3-BNsuaU7MsB=SW10-rcf2ND+2vHduVXX+Tb9Y1CfA@mail.gmail.com>
Subject: Re: [PATCH -next] serial: 8250_bcm7271: Fix return value check in brcmuart_probe()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Al Cooper <alcooperx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="0000000000001739fc05bec0d1fd"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

--0000000000001739fc05bec0d1fd
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 29, 2021 at 9:57 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> In case of error, the function devm_ioremap() returns NULL
> pointer not ERR_PTR(). The IS_ERR() test in the return value
> check should be replaced with NULL test.
>
> Fixes: 41a469482de2 ("serial: 8250: Add new 8250-core based Broadcom STB driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/tty/serial/8250/8250_bcm7271.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Al Cooper <alcooperx@gmail.com>

--0000000000001739fc05bec0d1fd
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
ttvt2FH7IWicVeEY2xMeWBfRtFY8anAKhTykkxVm9rAGHFj6Rj3tbMRCZizYUtlqyfrAUxkV7/+M
lJOhEKlpaANYkXoNuBW8PTcnOFVn6s1coaUCAwEAAaOCAdcwggHTMA4GA1UdDwEB/wQEAwIFoDCB
owYIKwYBBQUHAQEEgZYwgZMwTgYIKwYBBQUHMAKGQmh0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNydDBBBggrBgEFBQcwAYY1aHR0
cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAwTQYDVR0g
BEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24u
Y29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwSQYDVR0fBEIwQDA+oDygOoY4aHR0cDovL2NybC5n
bG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcmwwIQYDVR0RBBowGIEW
YWwuY29vcGVyQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBSW
M9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUB/Y1r/DQXIWt+XAn5hAwnXShDBYwDQYJKoZI
hvcNAQELBQADggEBAG4wYsV9AObl2akkl93oiHpdF2p7tbtd6H3GdNwyPcLHCIUa5inJwSFPRBdR
lFFxiicUm7yEVEHBLcYZF11xM+8hKoHq8Y7mtEXuJVvRZ+/0poqcJ9Y5ePe3U2oq+TIEboWtzBt7
pIBh/9lzSlx4WH3ICUhc0O3MSSfo835JpsaQ0L+xeK1vvh/jUgfO0dka/6VrcO9ImZQEPE/Rq/6X
BnyP/11h9hpq9LMet8vKQHzj05XHRchrP6sn0Yfej7LzhGFZG4P3U2VMOhRcyBvKtFJy9AhreOHc
fteRGM0b7B45hCt+xljp46Zi9N5DA8Q+UTXRUiAf+Xw2em834OXLRNYxggJtMIICaQIBATBrMFsx
CzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxT
aWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgw4dvuXenZP3ci2MSowDQYJYIZIAWUD
BAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIFXdxP90L7WlG0zdANCJMOstPPA/RBnfqiJ71Kx8Dg1f
MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIxMDMzMDEzMTcxNFow
aQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAK
BggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG
9w0BAQEFAASCAQCZyiDABqTcZPL2nYndSfy8z3H1d5UYiTzQJeAZIUISZuzC7KJ+ZdtLgLq6MDZe
YsqOaXJOS3V6nlJPY437zscmFsEZZlSbQ+brmTFe9lVeSMtzDqv91cDhC2JSFuj8U27y++gAf+4h
iQxIYdbvVzFPfwQmVxG/YAvSmOYgqG0W8eb7qS0NrsNRQnD5yWZKAiXdLCeaTYaBLCliSn/OkjUw
zfktoiJLPXd8wBF6MLQ5eDky0PZkDK0O016py1cbYsotyVYuSEZjaxvCG8V4qyBhW9GpK6PqJIFz
ptr7Wdg1g3FaHINJ1nime1OaaBFxbAKUhjov7Vy69jYteV9DdDx2
--0000000000001739fc05bec0d1fd--
