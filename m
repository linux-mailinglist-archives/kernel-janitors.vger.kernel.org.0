Return-Path: <kernel-janitors+bounces-989-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 625DA821502
	for <lists+kernel-janitors@lfdr.de>; Mon,  1 Jan 2024 19:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DF181C20DD4
	for <lists+kernel-janitors@lfdr.de>; Mon,  1 Jan 2024 18:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07A5DDA1;
	Mon,  1 Jan 2024 18:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="yYLT3OuM"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BD6D51D
	for <kernel-janitors@vger.kernel.org>; Mon,  1 Jan 2024 18:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d3ef33e68dso56668755ad.1
        for <kernel-janitors@vger.kernel.org>; Mon, 01 Jan 2024 10:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1704134545; x=1704739345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfokxdhSU4tLxSdVyPZZGBcng5PdbI1Z1I+Y2j7YQ4c=;
        b=yYLT3OuMpxyC/QjKAL77A5YmmzHCyHPOXwIVvuw85scv/7v8ZCR7W+oG7EKAcz/mW7
         WtkrZrJDRzaqmxwID4Hehb4uhNXKx5IS4YLfgONZ07HwzLQK3Ap/1o6nCyD/KRNED65j
         U/2J45jnRPsvQrI+KspdRCdfKNzbtL9fLsgwuOcst3nKOsmPIqwZmtZG8pjE8HJxMXny
         EWeUXpKkmQ3rCsk6zhJ33vKE904A545PxvgzsDdmWhB4Izzgy9GckZOuYz0a+dfGNIiR
         Ore1GEgT5aSUH2d7oUWOxtLUPqLvgNzy59zwgPC3ktaG1w7ZHb/nmBVpovSinXQzWugW
         w7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704134545; x=1704739345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KfokxdhSU4tLxSdVyPZZGBcng5PdbI1Z1I+Y2j7YQ4c=;
        b=rdNXElCMTPkmZeYWbrlVunW07vdRhmSkGacSOB4VCCKuNMsGYlAv36pYyhzF9AqoEL
         hanI7bUcMqkSoUrxrG4/Cz8TALq2LQOn46jTJlDxwLBVjRbYz5ITkt/7LtqUZGGfa51Y
         Ymvzgycq3v08J/YS5Fc+Ze4UxSzctaiXIKAa+TR83eJy4Nn0xRxP86aVYuHpP+2j068v
         nDVl+/iJm8C64x1laoSvymzECfbWvPg5IywnjbyU1RMcqBKLHrgnudgxKkXTWXqG8fmu
         R+fpUbvzDMZUwWjNFT7XarDKC6gKHkxM7QG879ztafPMUdBI9RsaVR5UWLizaAp1cIOl
         pjtg==
X-Gm-Message-State: AOJu0YzfqdqZYAIMcozzivJF4dqEF8dSbYA0B11Y+zKcm3SmC5H3doyR
	uiNEj+ZHE1mi/pKk1/AJcEbv20zg3IgWOA==
X-Google-Smtp-Source: AGHT+IErmgJv/Lk9O77zcBaYI+9tDns4C7D0gU3BnLHeBWPwqskMc9AH6WzdelWWRCzDZh6H4+yzgw==
X-Received: by 2002:a17:902:aa47:b0:1d0:6ffd:6108 with SMTP id c7-20020a170902aa4700b001d06ffd6108mr16256592plr.42.1704134545353;
        Mon, 01 Jan 2024 10:42:25 -0800 (PST)
Received: from hermes.local (204-195-123-141.wavecable.com. [204.195.123.141])
        by smtp.gmail.com with ESMTPSA id t6-20020a170902a5c600b001d3bfd30886sm19299248plq.37.2024.01.01.10.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 10:42:25 -0800 (PST)
Date: Mon, 1 Jan 2024 10:42:22 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Anjali Kulkarni
 <anjali.k.kulkarni@oracle.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] netlink: Delete an unnecessary variable
 initialisation in __netlink_kernel_create()
Message-ID: <20240101104222.00c6fff8@hermes.local>
In-Reply-To: <57779d2f-0d39-4c2e-8718-3c9242177013@web.de>
References: <90679f69-951c-47b3-b86f-75fd9fde3da3@web.de>
	<57779d2f-0d39-4c2e-8718-3c9242177013@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 31 Dec 2023 18:46:09 +0100
Markus Elfring <Markus.Elfring@web.de> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 31 Dec 2023 17:45:00 +0100
>=20
> The variable =E2=80=9Clisteners=E2=80=9D will eventually be set to an app=
ropriate pointer
> a bit later. Thus omit the explicit initialisation at the beginning.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

This looks OK, and the compiler would catch if it was a problem.
Not really necessary though.

Acked-by: Stephen Hemminger <stephen@networkplumber.org>

