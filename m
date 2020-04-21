Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB631B217F
	for <lists+kernel-janitors@lfdr.de>; Tue, 21 Apr 2020 10:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgDUIXl (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 21 Apr 2020 04:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726018AbgDUIXk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 21 Apr 2020 04:23:40 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2863C061A0F
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Apr 2020 01:23:40 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id w3so4995297plz.5
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Apr 2020 01:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jJPYTzU/qwb6g3+yildnhg4i9uHh1sBU123nH0Fg1tw=;
        b=l8Ty0zCKGlBiowmW2ric5YBCe2HNUA9dYKiO8Z9yZYvOnnNqzqNr3Akje+eJ/aXSEP
         RQhdAH7NvofA4f6y+6afQU5Ch6Zb77ddtE2JoVDRtw84NOvXVrxwbQlgkOaBi02fc0bt
         YzKbTNAn0Mwt4tG9acyFakNPCpuh++xPRdWWbwxc9pUMGlZBK27j/EW+bpkwlpPK1/70
         q1OHdb/syqGG/R9zjPUJkmKufmsAuwCI2uJkP6UYzUIHoZrKNuFWnNyLZzGcuICmaAjC
         4VWGcqHo9Srd3jJT+kZVbDFkL83KmiAalhVB+8VGuOtamO7c09qXG571cRfiuouf4fg4
         /2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jJPYTzU/qwb6g3+yildnhg4i9uHh1sBU123nH0Fg1tw=;
        b=UWEa91SJyfViqy+vClvECl9/5yZU0Na14I25XtSmwXaK8eDN5p0e0EiftdLIxlTWzh
         fKbjXjLCOV0etoeZ17AhTArPLChQnKhRUeC/BY01LuzkQvJxUi3KnrO9oHuUgpwH/oaf
         wmCSeq6iZLy1unRX5lZGs5DO3gzxMijCSxssUebuf0r5YoqggX765DIHUV9AqQy7oOmk
         o1uKetmypg3a8RrpUW2dYzxt/cwWKgJDom4Gg2nDu+nb7C7d/nfhnw58PF6xTjnQOOYe
         OPWmWefHwmK0F2DHQakGSSkDpyi/2D0xHWWl8wgEK2U2i5vFCihzWWIwLlTeHZuLU2p8
         mSBA==
X-Gm-Message-State: AGi0PuZxqBy+lDo92LjK+Vsugyq4hSEvAX7O6CSif/ER6KAlofOsQtjg
        /8bEGya755hUQo016O21bXZTaIVlFj8=
X-Google-Smtp-Source: APiQypK7Fc7xHOp6A9Bo8U97RcTw+jn6KQ4uqSrA69S5X6AxlVUMbRX0R9/LF418gL36/Bb0hJVTHA==
X-Received: by 2002:a17:902:968f:: with SMTP id n15mr19969509plp.11.1587457420215;
        Tue, 21 Apr 2020 01:23:40 -0700 (PDT)
Received: from blackclown ([122.168.166.59])
        by smtp.gmail.com with ESMTPSA id x195sm1772756pfc.0.2020.04.21.01.23.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 01:23:39 -0700 (PDT)
Date:   Tue, 21 Apr 2020 13:53:25 +0530
From:   Suraj Upadhyay <usuraj35@gmail.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: new TODO list item
Message-ID: <20200421082324.GA32008@blackclown>
References: <20200421081257.GA131897@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline
In-Reply-To: <20200421081257.GA131897@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2020 at 10:12:57AM +0200, Christoph Hellwig wrote:
> Hi Janitors,
>=20
> if someone feels like helping with a fairly trivial legacy API, the
> wrappers in include/linux/pci-dma-compat.h should go away.  This is
> mostly trivially scriptable, except for dma_alloc_coherent, where
> the GFP_ATOMIC passed by pci_alloc_consisteny should usually be replaced
> with GFP_KERNEL when not calling from an atomic context.

Hii Christoph,
	This is my first time posting to kernel-janitors. I would be glad to
help with this task but suggest me if I should get started with
something else.

Regards,

Suraj Upadhyay

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl6erXMACgkQ+gRsbIfe
744/vxAAlTYTMLuKBQ2X2VkCz6zzzzXDkBpqaAZGmMDtykR/a70GX9qye6zhos62
n9rDwx4RhCtD/M5mGp+e5fsvUDN3Q4A3rVv2cUHtlg290yddbJH/L4n1MZz+bgJb
gRUfAN1eEqgUVUcNZehkBouYt8mOIwde7Hi+cRTMLfG7GLNyTjgQvU+dMYAHmv0J
MZSqU3S+P3Ps4c+OZdqVNoyCn9TBJMBESDNwWR9vTZnpuYCKs8vRei40l/pluoRI
XGct0+AKNc7SULpWFW/9W0Kck9zUbTkJdB9JEokAtjKXGX7RI/9v14RAbOW6lR3S
dtRe8qsQchlGYnNJKGeYotXe8qdmCPfY1AEa/PsQeMwDcxprlz/oAU3jTIKYgbAq
38ALk69Nesrg1RsVegFYg6yuKuxL3MWLK9zhLrnFVoEhtzGzjHpBqyf63GenPMRW
S85lxvPl3KJLFFBER0AmdGL0y9V7rcN4WaJVUwMYnvD++4qLS0MjdTnFYwatcqnL
VEa1SbwyXePr257WXc5uS/5oKLWpoSL4BKE8poDjH2pvi1D4RQkQ2215JREHobM3
fxXIbHgtbA+MLK6Y1srVGshcGeZvt+XD16q06c6WhsxASm5lryPeHY0f3PhBLKHP
sBOvgx71Xan8lmTro1s+CUM7GxMk+SRklU+nneMo+Lv4QcyQZms=
=oc5u
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
