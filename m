Return-Path: <kernel-janitors+bounces-4793-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 210A393A456
	for <lists+kernel-janitors@lfdr.de>; Tue, 23 Jul 2024 18:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1D66B2289E
	for <lists+kernel-janitors@lfdr.de>; Tue, 23 Jul 2024 16:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197BC157E62;
	Tue, 23 Jul 2024 16:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="SVz+ftKM"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4748A15381C;
	Tue, 23 Jul 2024 16:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721751850; cv=none; b=DQWVHc5cPfIMQS+WxUKeJfE6SbvN7w2JB3+ljvXhtZx8q/OHqJO0DVkuB4u44hGBnzXiF9sK+tQQFYSegXE/TXcZ6h2yYSfisyiPpYuMsEI17CGz21A2dL84NwUwxSeQuzHJvgzYJ7rqLwnodW12Ax929PFsQR6SoP0PfbWRRIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721751850; c=relaxed/simple;
	bh=GfyZTlaRZ6in4sN58mTBnwj0jV4nAlH+q1NiB889DDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LRPtrXYNxouzdhnKNQLzYxY8Q/yp7SodRVi/dZMXQByMMM3/cvXzSBHxPZwOLQwtQ6suSHrnYlerAkvpwGd/xKLjYnjVwVFJLtu/mU6c11SY6KBFwivWOXd40izSvQ73pXHZW73RPdsmYc9+y0rcXSmq5ucH8ZiXUFJ5HJD+Izc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=SVz+ftKM; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1721751834; x=1722356634; i=markus.elfring@web.de;
	bh=qymtKMtz222jAh8w4pdYipiKugHqbVrcpK6zWOslD9o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=SVz+ftKMA1p/t+X22mO6CGdbI5mgddVSIvF9SlSHynOpQYipuB3WN7xgJJ3LwrJp
	 McAPbA/86ZFD0wdneJ4JpYAc4d3O16PnMq58ux7074XjgdTfcPoOj7wFWG+Yz51a9
	 +nV36WTO/XxBDjfXjw4VvklWpaRlbBqWfDrbUSMg4KA6YJX1OkLUXV5ojMe7/fK2j
	 H+i8dhgscbdV9rqS0f9E58kvJen/cXdhpwWK7L4Fx0cIpMhVFq27W2y3hwNaTvCdk
	 tp39M4ABxPkPLZ7lp03RcXGZyIKh2YBzNYVgdKhsvKdqC3XG1iuAGb8BbL9kbyGne
	 o9gf90jpYdPsdG/gTg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M6HFy-1sPfWc1Oa8-006swF; Tue, 23
 Jul 2024 18:23:54 +0200
Message-ID: <6636ae61-c112-48bb-acbd-89cc972cd282@web.de>
Date: Tue, 23 Jul 2024 18:23:51 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2] drm/nouveau/debugfs: Optimise data output in
 nouveau_debugfs_vbios_image()
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich <dakr@redhat.com>,
 David Airlie <airlied@gmail.com>, Ilia Mirkin <imirkin@alum.mit.edu>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <cb21950b-286b-4630-9052-cff9e7e56337@web.de>
 <CAKb7Uvj513trzg9bVGrjcQ8CfO4anCq7e9mgbD0eZKh=zNLy=Q@mail.gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAKb7Uvj513trzg9bVGrjcQ8CfO4anCq7e9mgbD0eZKh=zNLy=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:D5gHgzHG2snm2BneY/9rLIoyvAfRyLG0YCgE7dLY6aEjYK/sCWV
 BAJoEkOLPp0iEK/s/ispbissMxojf+heWcDa3/WiFzxH322ODTJ8Xvpf//OiysvviRJjbkD
 iO7nIhjEYBCiSFKPG7Jf6p+JgGRoOf3X6FKVum6FdoGrOmOH3zdL/qLEq3M8Fbhrr9/T6wN
 CW5piHriygaQ8l97JcAUw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gKS3DF7q8Ws=;R7HXf9nAL7DNpFKsU/CZ+krqeZW
 BnGcqW5XayKOACBusGleO+x5tXpL4fjtGOzuYAMSmlqrtnqyEpcbHP45H7eoKB3szdllx8ZK7
 P4GZQ+Y5Rkcg6vN6TULBEQgfPYJvJ8x74s3vKSz/mAXcpdmR/kMIFE1wjY+vFFDSiRMBlm/1N
 Wl0dgqfJh6kexe2NEwFVz9A5CzAIuL4xrYXA4BeUY4mqi5UUgAqMTgNYCjKF1lJGFeiBVvP9X
 xpiMyhkz7UxvLnVqoHdOPBXTKAzzO4LswfHYsn075IbmvTLl73Qm2mc0kVjijfw0L1EK2A6zW
 1lhfT3Bh7tQoTs28jkuDtFl7PGl4U3s5INPVuygDxAi/hhH/8uBC0HdjIUKYIWC93VH15i0Da
 6pGU3rJDvG+kmQHTR9hZGAei8/7hhgRBnnrrv+3OvEuZCrcDyHMaWvXsbpKpj14xl+JbgpnPv
 g02GjaF+1K9Gq02f0ZRZzhWdWtPbYiMMJqkfp622/29/nwtyMIG55uz9QjA7LESd/C7NhXEUu
 ueATWwVsMsO8/IHFaLn8l9DT6MZbnjE9fU4KkcDFZ2s4QhCpCVTY2q/RLEg81+7iGp2LEPOoc
 uwhlzPsY1UqgevV8WyraS2ebg03JrwxuTEwLybrhls4T76VKiIujkjuxvoaE1YToE02ul1BqY
 Ram54Ygwm2VOUJ823QhYhi1n1+FdKxqdwGk8ijrqPozbMvLxK9Gqm0713b2T3W+Srpz/abdGK
 DLOrXQPhpab+rGPe2esuuBDXOe4Xrv95IK+H9sYnywMy1unUCjzF0jaJ2l+3keiEm9qzdMhsX
 8280gCybOWCHtArAdFqLqrMA==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 Jul 2024 18:08:15 +0200

Some characters should be put into a sequence.

* Thus print all data by the corresponding function =E2=80=9Cseq_write=E2=
=80=9D at once.

* Return also the value from this function call.

* Omit a local variable which became redundant with this refactoring.


This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--

V2:
A patch review suggestion from Ilia Mirkin was integrated.

 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/n=
ouveau/nouveau_debugfs.c
index e83db051e851..980cff265060 100644
=2D-- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -39,11 +39,8 @@ nouveau_debugfs_vbios_image(struct seq_file *m, void *d=
ata)
 {
 	struct drm_info_node *node =3D (struct drm_info_node *) m->private;
 	struct nouveau_drm *drm =3D nouveau_drm(node->minor->dev);
-	int i;

-	for (i =3D 0; i < drm->vbios.length; i++)
-		seq_printf(m, "%c", drm->vbios.data[i]);
-	return 0;
+	return seq_write(m, drm->vbios.data, drm->vbios.length);
 }

 static int
=2D-
2.45.2


