Return-Path: <kernel-janitors+bounces-1493-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4B683F9AB
	for <lists+kernel-janitors@lfdr.de>; Sun, 28 Jan 2024 21:06:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B7EAB21512
	for <lists+kernel-janitors@lfdr.de>; Sun, 28 Jan 2024 20:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E3D3BB35;
	Sun, 28 Jan 2024 20:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="vz/Q/L43"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F6831A82;
	Sun, 28 Jan 2024 20:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706472396; cv=none; b=KvhXzCMlhsFd1Yr/mwLd4A9OSCbWLTNaugn/fgyUy+AE58PyXIms8xbp6HXlhENH5Co28FidPwMLxcT2Vgee167BL83+PQzV+zLARFJr+APjeeOsAlOr0p8dw2Ds7DGfsMF0jb4BtXTNZv2rjbHS9wCvIsDmrp/pgkxzms021Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706472396; c=relaxed/simple;
	bh=NgaXvXQoHsjxe/EA1Ybr+FQWYg9KhJGN4jFPViGSQxU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=aTBflspv3NwAd/cF5Sxkjw3JGa879KNhbT7GA2+UvR0fjOS6oMQLJlyLjY3QdCLlrtshiXLyDmYnthuqg2Tf7g182n5XbQOXaWu95obFBjjFjrck8TocOs7XUEUMOBC0JJXaFzSTQTkuANSYDttcyYMPeNWkq2XtMO4NbBXuf9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=vz/Q/L43; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1706472371; x=1707077171; i=markus.elfring@web.de;
	bh=NgaXvXQoHsjxe/EA1Ybr+FQWYg9KhJGN4jFPViGSQxU=;
	h=X-UI-Sender-Class:Date:To:Cc:From:Subject;
	b=vz/Q/L43/Tc6KJxGJGbdWl8qyaIutUMg/3lI5CrC9uehl8vYhCoWHl0V/D9yvoJI
	 9pnI3QKHgIpLt6YTQiJS5KDX2ppq2CPESw5rhpSUOM3LQPnDBsjGiDPvAf38LM6UO
	 RCor65Dgnvj6JeXS+4FPGFwsAQ6k731rdCL4xY3HcKkn9ex0OOQinNGSPmH8QghM+
	 uEKcoztXp7QTOdZD9PL8QO3qDlM8Yl1298+PA3/mtgNchVmagKlaSeoF8Jjp/9zJi
	 3muccUJZ+xxaatwaZEsDn3VjVNee/MItKlklBV4MsyoyuDUqMuPnc5OXsGirN6w0O
	 rgvhTPAh4NsYSWt9jg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Myf3v-1r9U8U2P6L-00yX9a; Sun, 28
 Jan 2024 21:06:11 +0100
Message-ID: <c07221ed-8eaf-490e-9672-033b1cfe7b6e@web.de>
Date: Sun, 28 Jan 2024 21:06:05 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matt Coster <matt.coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>,
 Sarah Walker <sarah.walker@imgtec.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/imagination: Use memdup_user() rather than duplicating
 its implementation
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:koqS3eLltv+QIPN2RCW3+Is0PGswqbQ+2Rizm/ODddQBc60oNWw
 zsO7XtPEFBC/fYJPfyzbKTyXby9HwP2MYakOHwpAhdyTV+R+mxOhB7f2s1JV+tNvwmhwqpk
 /rC2b440t+5NuTYmzEOJVbrLTJXE6hgFBAxN9bAYLcyU2uuilqZ+453fERFTSqIirVuqLqe
 Ojh24tWpBrPas8DOKi8BQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:06n3TwzjoMw=;WhAmErG28I8KWN9Gnz8yyeHqEEh
 +AIQfj6wNSVkJKDyoFhoYA+2h+Mz8gNpke7q0+aS3I8Ub5Uev/yTyTXj3+vE01BbvtSbMG8+p
 2m22BKjoTrmOzp96SzciIJS/4PbRbcGeuFf27QQmeJp5qVoySyUigpiVqQ/08tB7uElJ8sSj3
 FZEZkftcJXsmwzOoCCmHwvPHt74grQC5+rAw8vqeq9o9Hsl7N7HORizLgqpRIgOmPJ8sSIl9p
 EU1Huagt9m8rw6h1qsOhMDCWHzuwlS9Vtb7mj9sDCbTwJihK5xBd0VNHt2Nv/VrB8SzzaGSQy
 aLMJiOPhZsJeRWVLfXAZToGIVlhhV444JTlZhjlSwzRrKHpca82O/VVKZAjyAgWu7er2d6vJK
 mpr6fRRy1zyaltc9bodZlRiIZVD7Wt5M4qb+b+DrN7FvTjtIVm74dvLaUl3BlhPwRf9bS8Rjy
 aujj7LpfASJhWqpe77q3TrkSo7YHNdJxu62cJ/LTt0Hn7wQaSBKKPs4nm4OOxLxueiakmZfo/
 Hk8K0/FSsacskAms6/Uok9Bq4a5vp/hTljqydjDelXpPUs/WtuwCX/MIVo111H7tTo1cNRiRQ
 bTjpF6y4ma4vzpKTqE/LEvPF64S9eJr1vY774HtkID4cUIKwmo6JrhP6Q0DMCmdQNTtgCup0n
 hwZLtUjBs44Iq0j/0iaTiq15YTB8FM06r8tlaJ35/a4YglCiV01/+ZJgXeC0rHX3+vJJyiDZF
 0hW7Fv4NhkqQQEA/8V4yC6ENm37+/yrrtzsb7lAHA0GPRKAJcZOKCVBHuY0laqf2eKXxs0UmW
 GjWVYMPWvafsysOD3LD+KfKPlKmVCiR/U+NCIOYM85gwdBj7BX7ZsWQriVVRwtVfWZgzdr6gA
 YWfmTBp5ZP49ielVhdZLsLvW7xG1lFjb0cu531ZMaNsXd7Ui1d3pQUukRE4/kQrQ4Mf81XMiY
 iwblTQ==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Jan 2024 20:50:36 +0100

* Reuse existing functionality from memdup_user() instead of keeping
  duplicate source code.

  Generated by: scripts/coccinelle/api/memdup_user.cocci

* Delete labels and statements which became unnecessary
  with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/imagination/pvr_context.c | 21 +++------------------
 drivers/gpu/drm/imagination/pvr_job.c     | 15 +++------------
 2 files changed, 6 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_context.c b/drivers/gpu/drm/i=
magination/pvr_context.c
index eded5e955cc0..27814ae8a8f8 100644
=2D-- a/drivers/gpu/drm/imagination/pvr_context.c
+++ b/drivers/gpu/drm/imagination/pvr_context.c
@@ -66,29 +66,14 @@ static int
 process_static_context_state(struct pvr_device *pvr_dev, const struct pvr=
_stream_cmd_defs *cmd_defs,
 			     u64 stream_user_ptr, u32 stream_size, void *dest)
 {
-	void *stream;
 	int err;
+	void *stream =3D memdup_user(u64_to_user_ptr(stream_user_ptr), stream_si=
ze);

-	stream =3D kzalloc(stream_size, GFP_KERNEL);
-	if (!stream)
-		return -ENOMEM;
-
-	if (copy_from_user(stream, u64_to_user_ptr(stream_user_ptr), stream_size=
)) {
-		err =3D -EFAULT;
-		goto err_free;
-	}
+	if (IS_ERR(stream))
+		return PTR_ERR(stream);

 	err =3D pvr_stream_process(pvr_dev, cmd_defs, stream, stream_size, dest)=
;
-	if (err)
-		goto err_free;
-
 	kfree(stream);
-
-	return 0;
-
-err_free:
-	kfree(stream);
-
 	return err;
 }

diff --git a/drivers/gpu/drm/imagination/pvr_job.c b/drivers/gpu/drm/imagi=
nation/pvr_job.c
index 78c2f3c6dce0..e17d53b93b1f 100644
=2D-- a/drivers/gpu/drm/imagination/pvr_job.c
+++ b/drivers/gpu/drm/imagination/pvr_job.c
@@ -87,23 +87,14 @@ static int pvr_fw_cmd_init(struct pvr_device *pvr_dev,=
 struct pvr_job *job,
 			   const struct pvr_stream_cmd_defs *stream_def,
 			   u64 stream_userptr, u32 stream_len)
 {
-	void *stream;
 	int err;
+	void *stream =3D memdup_user(u64_to_user_ptr(stream_userptr), stream_len=
);

-	stream =3D kzalloc(stream_len, GFP_KERNEL);
-	if (!stream)
-		return -ENOMEM;
-
-	if (copy_from_user(stream, u64_to_user_ptr(stream_userptr), stream_len))=
 {
-		err =3D -EFAULT;
-		goto err_free_stream;
-	}
+	if (IS_ERR(stream))
+		return PTR_ERR(stream);

 	err =3D pvr_job_process_stream(pvr_dev, stream_def, stream, stream_len, =
job);
-
-err_free_stream:
 	kfree(stream);
-
 	return err;
 }

=2D-
2.43.0


