Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE9C4AB33
	for <lists+kernel-janitors@lfdr.de>; Tue, 18 Jun 2019 21:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730388AbfFRTth (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 18 Jun 2019 15:49:37 -0400
Received: from mail-pl1-f169.google.com ([209.85.214.169]:39212 "EHLO
        mail-pl1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730176AbfFRTth (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jun 2019 15:49:37 -0400
Received: by mail-pl1-f169.google.com with SMTP id b7so6138840pls.6
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jun 2019 12:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SCzkPutafS6puOzenmw/jtEGahtjfTycw8CEIiSbQ18=;
        b=hoC6zDdIV93amSLFot1BR7nmnxvXEgTTZ2MJ8694yabGA7bGfvVfHTvYNBb2uAHK73
         RFigY5dxByvW0CBNPf3ozXgkP9+XQs9/BMlgN1afYP0eSCmpTkcQIvN5p9G2hLtrnoYl
         mIC4AomWgK1zpD5Cw6onogaUzO52/eMupcHeiXqGz2c8I08qzXS1oiEzceYksw57tiGJ
         Fy2nWWuTODVtz3gSZ5Y+i1UEVwmft5z+JMM2mnB/y9MNUQScOg5eUXhZfuZNJwUVv1rP
         EInECaWQPmaMbyseskPu2FNhhM6ZAkLW6Yh3JJlfm8buCy0dve7e7M1PVr1+zHYAAEbt
         KTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SCzkPutafS6puOzenmw/jtEGahtjfTycw8CEIiSbQ18=;
        b=WL1Cj01dMSD3hLKdLEKzB79Hqt6ZzKSnHwTgMK/nrLFYEFSF8EyzSlbkW+k8ld8l/O
         vvpHwQ3S2sRdzv+aRifPa6SdonG8K2FHcpp88Byx3jSaEPeF44o63fsLYSFmKgd/vYKx
         nt3ukZ2uKPl2ByPVTQCiid97nHZr3vHaTzenkh/XtSiB4CjIez3QoaJFT/XkmI5+2fwB
         MNzIBSDAMD6KClFAL8Bez1m1CdvxI5S+dqghHiLJXZWLLsPIDWNg2SbPm0l+ZeuFqT4c
         6nejfr9SjU33Pp0nmGqINo3NMcuigma3TEaGDdGusQ7ldJz5QLW3Rs1vgb/YILzlUDX4
         lFRw==
X-Gm-Message-State: APjAAAXsaPIOvVdYRzC3KSVkNmzsPHpHkcfeTWDg/bwKFpppNbliXwl2
        zExnV9A+jfyHyYI78kROhW08Ew==
X-Google-Smtp-Source: APXvYqyfDVhE0Rj7KuDcNm/CG3YH2wDN54io4gffIFDGt0FGePEgYgI5wxJrFEl22T+h4+UcoBFmig==
X-Received: by 2002:a17:902:a405:: with SMTP id p5mr43107506plq.51.1560887376052;
        Tue, 18 Jun 2019 12:49:36 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:bc61:d85d:eb16:9036])
        by smtp.gmail.com with ESMTPSA id y133sm17606800pfb.28.2019.06.18.12.49.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 12:49:35 -0700 (PDT)
Date:   Tue, 18 Jun 2019 12:49:30 -0700
From:   Benson Leung <bleung@google.com>
To:     Nick Crews <ncrews@chromium.org>
Cc:     Colin King <colin.king@canonical.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        kernel-janitors@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] platform/chrome: wilco_ec: fix null pointer
 dereference on failed kzalloc
Message-ID: <20190618194930.GA209269@google.com>
References: <20190618153924.19491-1-colin.king@canonical.com>
 <CAHX4x85sETNNS8gdQYQniCM=K35DjMjdHOihJ76pGPrAoB9gyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <CAHX4x85sETNNS8gdQYQniCM=K35DjMjdHOihJ76pGPrAoB9gyA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nick,

On Tue, Jun 18, 2019 at 11:15:03AM -0600, Nick Crews wrote:
> Thanks Colin, good catch.
>=20
> Enric, could you squash this into the real commit?

I've applied this to for-next and for-kernelci in chrome-platform.

Thanks,
Benson

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCXQlASgAKCRBzbaomhzOw
wvzvAQCyOTKS1SOAS0+Jun5Ci7dnvQYHXaDKXlumIB/vwgWr0wD/YyL8KgdowZi8
meyb3F1r5KtA3s6FXZ/AN0VbqnHDUws=
=3u8A
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
