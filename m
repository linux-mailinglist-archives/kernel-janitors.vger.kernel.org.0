Return-Path: <kernel-janitors+bounces-7267-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D73D6A4B4C0
	for <lists+kernel-janitors@lfdr.de>; Sun,  2 Mar 2025 21:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D0A2189105F
	for <lists+kernel-janitors@lfdr.de>; Sun,  2 Mar 2025 20:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D8B1EDA3E;
	Sun,  2 Mar 2025 20:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="fHY9471d"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651AD3597E;
	Sun,  2 Mar 2025 20:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740948974; cv=none; b=Tn0h6zvBIuHfYAKpv2Nmwm7xl2nxBm+myLEer4OZCyjrvB+hnr2zv0gUJBSqpCbK4LBFRMtFJ/jrFwFXFrWzrQLUjyhKKjDa4Upi+qJ08Qlg9Yt/5NJHMq/PNmWm6JLJB1vz41kdvIr91PBGWJIV2kZ2AQMs3zHDQn8DFNrRvvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740948974; c=relaxed/simple;
	bh=p6syizpmJ76lC1s5B/Bojjtqe0nJEKWlGClU5qNt4hA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ut1T4offmgqhaoCG28kPg78mR0EcnkTrWc5ibZRt6pwJZZE6FPxKVbIxQaR/QNOr7+bF8A9DTpNHESsVgCEyjfCZ2AkTF1ph31/GbjPUHn7vGh58lSB7k5g/0ttfPCQUbVL4G9ay4AIeQYsmTmsfEv8KoCt1ZWlCRQf6DxbydE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=fHY9471d; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1740948962; x=1741553762; i=markus.elfring@web.de;
	bh=mGq/gU9aiLC9wUlZmOgz0EtXdzSoBZk03x6MS/EQwvY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fHY9471ddlM03q0Z3Z3datTM3jBbdpRS22zBeKT8ZliBajHIdlhHQvGGEo6+58c/
	 aW/Veu4zpHaWYtpfla1mnxKePDKXcoTsODUenhZTQeA2VCMi3DsQD0MuTyIoBTl/i
	 4gZwYLSC4+E+9PgGeTXl1FGO7fuOpxUE+IsEHRBsrMFejAJoZMM/1ldkENDxTfguL
	 hFmR3HsGN8XJESDazCiRHCYD3LEVdr89EL+QKiKUQt9uHfNCVgShdvN0ZpzDAwpu+
	 hgArzZXRhJl6XDfjpzygg9k84ChZb6Vy1mdhpjn0l+k6vq6Am/oX/hnj4dSo4qnmn
	 VcnftArw3ZeAqk/ifg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.30]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MLzmv-1tXRvX2K49-00Mg55; Sun, 02
 Mar 2025 21:56:02 +0100
Message-ID: <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
Date: Sun, 2 Mar 2025 21:56:00 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH RESEND] drm/msm/dpu: Delete a variable initialisation before a
 null pointer check in two functions
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Archit Taneja <architt@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
Content-Language: en-GB
In-Reply-To: <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZXKKocm9YimrPH2Ai0mrevWkO84hjFpKhemYZk0/ziXAXy6/WRt
 MVT16mJFRDXIppSjxv77pPSQJFitb+KAakBf3ndC0onKZSiEhxx92Rw7fKew5iXRUWM/kbA
 NXlThqdMLWdKw4ICz/gOgP2zk7b1y5j85NjdlXYP0URExCPCbJ/ep3jYrenWGue6Bouz2qL
 Apu5N46AkpQFobLYGONFA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kuP3KBswb/c=;sypnX5yZi7yu/vG/c6hJxyLA9sm
 4FFHfcQSG4QIpCBVcJ4623jDYFkTg7UBOSCc/c5lbAK880V3IIjOf932Ji3oe2JigEZlU+Lxu
 V/GEr8r/L6g8jm+hd53cinFUfMb/ZXxOJk0ZkJkSZUhjMiaOkGW6HWWIp+eLOCrEq6F+WVejU
 P1Y3iPVu/tOvw5Sb36cnOWDEbooRvc+76ttxhKGLioRNgQN9pINxdWGZXe9mkfhvUVFutjQbH
 +YQIDirHQMSXh/KGmFgbyuM8gJiypXUJjTrm7WutWHQ1gmWbGCaXKUTN+PdD6op7sacXpwrDj
 88skEnupulUC2wRnSHi/T6g/v47xUaU4zHStF5l3EdtBWxR7EuZ8WJQGT5FvkyPuE8Nj5/isy
 ESGdZNQ6ONGI14/6O5q6N9gch8qRMHIQr0ecpdVJt7Lh+Vv5jjTsvjItas1eF+M2v0zOlvP0b
 sMQYoRWmY7jtnzjOLEhCQ8X+O0RbShmqNetrvMMQSOnp/aQPM6i9Rluhf5L6cScZIdnTgTP2t
 d5e7dAk++hwUcRx7LtipOyZcVFtK1yMv+CnGD/L4s8dvIkbS/lQQgqzgtH6vZnKOm3928+cj7
 tpH7QjfcZvpOiWNkRlKvynX+IXQAs2plsiyvJBrN/NbNpwBWNhW+aEXa6ES+tuWyeUmcwlztm
 kS2zd+BHBiB1dWloIP2bIcUaaJzrCmHeKNrSJKCPNpPkLwpyGO+mUkSa3h5PHvXuyGVuPpkRS
 s2LsvkXgh1IkirHLe48B1kje4OSStHoUULlBWPS2q/FBEt16rXqn3RbYNRv6tZbdYz6AdXlJJ
 UIchkTLxZJgZDsjpzbDfagbNvB6kSctp/c1NfxTkQ9chfgnaaBSt6JQ1cez9LgNudeJbrNU84
 gbmMcs0iwvnJGmRs1ODQoBEl6kOU6ILn4X4pKd7kBGPswj87DNqn1QrZDMSI3Tbr6K+YEnzGz
 ViMRFwe7916RUnYV70lMOrYJTQBE8CO8FOe1PdPAqgu9++58oQD6zjCxXqMVTIBU1s4VNEaIO
 S6pTuSYmvHFttfd37kKiqikzJCCw+fl90dYNuQK+XaMKIOMc8IkuJFi/SEHwsYDYnL74SkRuM
 8fDQQT0ASTWwBv+86LV2vv01kwBoVHZOf+rJR2Wlo4aWUrhXN1sCnysVPVrEoRJVYRsnOOB/B
 RF+M2H/sOdKNAfbCCGn0CpFIEHRl/X2ngW139q8RnABV/B/ImcIjh6Tt+9++OcAYQWmG3tdFt
 8w0CVuB6bu5iFPGeBjfAp87r/t3+qi/l/RKg0d2cCEYRhqy5Lj/dCIX1A4xRTequnnSWsbbqk
 T5G+5TerQFlj4fBrOPJ8pkaiPZVlawL+pAl0e8RtUG15k16LCPfRx7j7B1SGEaB7DSBMSl/Kl
 PpTcXuUSKKZA8sBfxaV4TM5OHBPjRd9xAslXujSz6RfP5fgcsq6G/jQ06rZJQrUdh2s1cegqs
 WID3uCQ==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 11 Apr 2023 18:24:24 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the functions =E2=80=9Cdpu_hw_pp_enable_te=E2=80=9D and =E2=80=9Cdpu_hw_pp=
_get_vsync_info=E2=80=9D.

Thus avoid the risk for undefined behaviour by removing extra
initialisations for the variable =E2=80=9Cc=E2=80=9D (also because it was =
already
reassigned with the same value behind this pointer check).

This issue was detected by using the Coccinelle software.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 0fcad9760b6f..870ab3ebbc94 100644
=2D-- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -176,7 +176,7 @@ static int dpu_hw_pp_enable_te(struct dpu_hw_pingpong =
*pp, bool enable)
 static int dpu_hw_pp_connect_external_te(struct dpu_hw_pingpong *pp,
 		bool enable_external_te)
 {
-	struct dpu_hw_blk_reg_map *c =3D &pp->hw;
+	struct dpu_hw_blk_reg_map *c;
 	u32 cfg;
 	int orig;

@@ -221,7 +221,7 @@ static int dpu_hw_pp_get_vsync_info(struct dpu_hw_ping=
pong *pp,

 static u32 dpu_hw_pp_get_line_count(struct dpu_hw_pingpong *pp)
 {
-	struct dpu_hw_blk_reg_map *c =3D &pp->hw;
+	struct dpu_hw_blk_reg_map *c;
 	u32 height, init;
 	u32 line =3D 0xFFFF;

=2D-
2.40.0


