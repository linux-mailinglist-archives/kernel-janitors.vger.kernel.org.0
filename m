Return-Path: <kernel-janitors+bounces-381-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AEB7F41D6
	for <lists+kernel-janitors@lfdr.de>; Wed, 22 Nov 2023 10:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFD4C281813
	for <lists+kernel-janitors@lfdr.de>; Wed, 22 Nov 2023 09:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C6254BF4;
	Wed, 22 Nov 2023 09:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZyJh801"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0DB10C;
	Wed, 22 Nov 2023 01:42:05 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5a9bc2ec556so4246358a12.0;
        Wed, 22 Nov 2023 01:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700646125; x=1701250925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=abM4W7xPRLNxSr6XVpDl8XekNAlf56sZOpqa2J1fPeA=;
        b=PZyJh801bN8aZubpXbYXUNIAKBkJDSc0EqwLd0cGoLT19sHEPEU1Fk2ubJzYHY268x
         R3mzqkuwj+Ov5jsmagT7ySIuRfpmx0wJ9n3jpc+TppUwLkOrXV8nrF77/rPLyaW9hWLb
         nX9k4UGIyECjp2axANWstw9xvYkFQs9H5GSRzldExmQ648gx9fLDVOdEi2svkuJDgAOu
         ST7a+v8qUt86O8hSuCi5YoZTkQvYc/xrDJEWAeGJa2wVPNj3E3meID95VVPZTJlZKf1+
         /a97whNOeB2jif//wB3rm31DrtZ6qViU87simbPnvnzNBAHdwFR++/CKBWXqVxumQWQi
         pZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700646125; x=1701250925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abM4W7xPRLNxSr6XVpDl8XekNAlf56sZOpqa2J1fPeA=;
        b=afMsjM9I/Z/GMKW8VigBiURuRTohZDmL48eZk3qqAQqo0IVcL/EjbehcaenU22Cqwf
         TcJ6suCKSjAkPqBMIc6SbwG87nEjfMmdn9Y/Gv+Ko3Wj57BAisoXDTeDpG0AqPD3lGvu
         HmqOc5fG4362jc1b4LRLIqfonvne+p4hwkTpYck3V4b0xWlt6IRZ79Kp9PVFvakucuE4
         RNU39rXMwuxbj7p9aSIrKRmGMNR8V+5SilAFOPZkJdAehzRaF6X2cWOfCGbcrH9o3jJZ
         JPdwdraPuSP8k/zvC2akaC/+ero0Dzw2mU7zh1cDtqlLbhC2bTnU99Oy9bTkAaEcEm3N
         49CA==
X-Gm-Message-State: AOJu0YzIYog+ryWntC4nwnlxgDcT7oK+vP8L/N71dHtciPQpz1A26azf
	yNwjsEDeNpYzpgyGRlRfLUg=
X-Google-Smtp-Source: AGHT+IHqeWNO23DIW2lYuAdRhp6TKZ+eKAtoCVKFyJQdL7W+3OHe2cC/WMjkijKCBJRvRfwDqiTwfA==
X-Received: by 2002:a05:6a20:2c91:b0:187:ce9f:e198 with SMTP id g17-20020a056a202c9100b00187ce9fe198mr1422428pzj.5.1700646124816;
        Wed, 22 Nov 2023 01:42:04 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090a488e00b002851466f471sm937659pjh.31.2023.11.22.01.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 01:42:03 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 5B10110210547; Wed, 22 Nov 2023 16:42:00 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Staging Drivers <linux-staging@lists.linux.dev>,
	Linux Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Bruno Moreira-Guedes <codeagain@codeagain.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 0/2] MAINTAINERS update for VME subsystems
Date: Wed, 22 Nov 2023 16:41:54 +0700
Message-ID: <20231122094156.30642-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=856; i=bagasdotme@gmail.com; h=from:subject; bh=2Jh5t3H6agB2YlqKVyZOWg3kjv4ysogPOLg7wiXeDUc=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDKmxpx/vc4r/zffF9Mi7w+4/1SZPCBAQnq/Vtqp14lyV5 bFTuKZFdpSyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAi5/8w/Gabr/jL4GbTtDhl YRXmEI4lp0RnbOp+u2GKcONyFy1udTtGhsklKo7i22cs5VrgefKDJOsLZtZZd6unf5z19qJxUY2 TMj8A
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Since Martyn's last VME subsystem review [1], VME maintainers are inactive
with respect to the subsystem. While Martyn is now working for Collabora,
Manohar is AFAIK MIA (his last email about 9 years ago).

Update MAINTAINERS to reflect above situation.

[1]: https://lore.kernel.org/all/3e91b72a86294b542acf460657d0fd94adeb252e.camel@welchs.me.uk/

---

This series is based on v6.7-rc2 (same as current staging-next HEAD).
Greg, you can pick this series up via driver-core tree if you want.

Bagas Sanjaya (2):
  MAINTAINERS: Update Martyn Welch's address
  MAINTAINERS: Move Manohar Vanga to CREDITS

 .mailmap    | 1 +
 CREDITS     | 4 ++++
 MAINTAINERS | 3 +--
 3 files changed, 6 insertions(+), 2 deletions(-)


base-commit: 98b1cc82c4affc16f5598d4fa14b1858671b2263
-- 
An old man doll... just what I always wanted! - Clara


