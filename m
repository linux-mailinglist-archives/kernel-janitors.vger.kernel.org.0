Return-Path: <kernel-janitors+bounces-912-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8921C81FC63
	for <lists+kernel-janitors@lfdr.de>; Fri, 29 Dec 2023 02:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E1031F24879
	for <lists+kernel-janitors@lfdr.de>; Fri, 29 Dec 2023 01:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E11B17C0;
	Fri, 29 Dec 2023 01:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="JZIN6RQL"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492D317D1
	for <kernel-janitors@vger.kernel.org>; Fri, 29 Dec 2023 01:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3bbd1fab03cso763984b6e.1
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Dec 2023 17:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1703814004; x=1704418804; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X83wfcIZjdEzwkgoaoOF5TgcwBhLow4MMDfeVCMjkfI=;
        b=JZIN6RQLPwWPrNYejknxjeb3NsRvRn5EOS6CM4zI6ZQ0XqQneJr6Fi0UENAed7XG6I
         YwcBno33XYUt1huylG1ibVDWNSQwuwWR8qycMDQOikLeHCM0yqUiqpZWthLGymoRc9L0
         werbAd1WSrGY1C7RHyU6vh0y28I1L7l52d/5E2n7Temu1EMFF/xFt/gLHzgpuSlsp3Dj
         mMHOBYCkKTAFAhaQFSprsR+DWVIJJc5mM8Goq9/1IAzgMdIZh2z7PmOgWYPtfwn1537F
         ZFIe0dXG3y7wULB1TKVqj8GzuNpBhSZNEe4A9LbtvoiejZJPWCtz2McRomeM5DsqeUI3
         i4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703814004; x=1704418804;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X83wfcIZjdEzwkgoaoOF5TgcwBhLow4MMDfeVCMjkfI=;
        b=Cb5fMGCSeeeCnzxm4Te4YU8jXox1XTNmquDkSIsc4F++bRwJGMTKAhvZckWuxlBeHe
         yEcR9tNHt7HkNyPaYKTR4idgxM5uIxvv9VuXyMFEv6O4XLW46GOnyP2Y7ggNRN5JK9xg
         4mJZZJ0W271hQZGx509HdsN980BGOUgoKz2kANfg/PDA5OVahJ2QGaOHwjVrkMZy/lEx
         KtxBfbbMpUxh3eW2MKXH13vXiGkVhBn2mxTk3tT09E/hOyWVwfUAu+eeWVRrPs2hxG1B
         6DKlaFXWhMiHTu9peRpHFtVjB6Fflku8kfvgDvq9OnooKrcFoHd/fyJ90XCMVM4vPvT4
         zzoA==
X-Gm-Message-State: AOJu0YwyJ4FtRzcaDqtsth2kmPclAuMnbeLFn79oRDHe6I2FG0MFxXHi
	AeY9wt2mQGJr24SlF7qQ9Bys4BKwsKE3
X-Google-Smtp-Source: AGHT+IGF60wU+mSoalWd6UHlhEo308YpqtgcdbGQB135dpTj1IDi5N7qX5FYXhcD2SQ93Jv2z2NSnQ==
X-Received: by 2002:a05:6808:318d:b0:3bb:a777:e891 with SMTP id cd13-20020a056808318d00b003bba777e891mr10630353oib.104.1703814004373;
        Thu, 28 Dec 2023 17:40:04 -0800 (PST)
Received: from smtpclient.apple (76-10-188-40.dsl.teksavvy.com. [76.10.188.40])
        by smtp.gmail.com with ESMTPSA id p2-20020a056a0026c200b006d99170ab87sm11391939pfw.182.2023.12.28.17.40.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Dec 2023 17:40:03 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH] PCI: switchtec: Fix an error handling path in
 switchtec_pci_probe()
From: Daniel Stodden <dns@arista.com>
In-Reply-To: <20231228235626.GA1559849@bhelgaas>
Date: Thu, 28 Dec 2023 17:39:50 -0800
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Dmitry Safonov <0x7f454c46@gmail.com>,
 linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 linux-pci@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A483D7C9-07FD-40E8-93F5-5688AB6C9040@arista.com>
References: <20231228235626.GA1559849@bhelgaas>
To: Bjorn Helgaas <helgaas@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)




> On Dec 28, 2023, at 3:56 PM, Bjorn Helgaas <helgaas@kernel.org> wrote:
>=20
> [+to Daniel, can you take a look?  If you like this, I'd like to
> squash it into df25461119d9 and credit Christophe since that's not
> upstream yet]

Thanks very much for fixing this, Christophe.

The fix looks correct to me. If it can still fold into the previous =
change, all the better.

Best,
Daniel

PS: without trying to complicate this thread, does one know idr.[ch] =
well enough to state
whether ida_free() could have gone into stdev_release()? The way the two =
idr_free calls have
been placed looks intentional. But stdev_release would look more obvious =
+ cleaner to me.
Was only starting to wonder while reviewing the err_put side of this =
patch.=

