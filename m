Return-Path: <kernel-janitors+bounces-7357-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F35D8A4E95C
	for <lists+kernel-janitors@lfdr.de>; Tue,  4 Mar 2025 18:39:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD8C17A3479
	for <lists+kernel-janitors@lfdr.de>; Tue,  4 Mar 2025 17:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA8B2980A8;
	Tue,  4 Mar 2025 17:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AE2vC9EL"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A6826036B
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Mar 2025 17:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=160.75.25.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741108291; cv=fail; b=ktvCw7aEH7ZAspBp4R2EnPzaxoK+91ohNZW2r71Pb0GL04ZVfIJwJg3TpMeupp9VRC3mTAp4+SKm6obrc0tUjzg83B4QLZ4gbJT+Fi+kEqOotXHBRuwiuP6Xd/NFxafnLLWc+7f1NYfXMes1B6+BAPlx8lEOCEIv1eg6cCUcwiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741108291; c=relaxed/simple;
	bh=6j7hTQM6mjnR72Hy2bRNMRgFNcMjTw/1upucggLcOSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KxFBeTiwXedzROdyWHqKRSbLx7YdHc1T7EJXkz5Q4bc+p+rqowDQZuAV8e4LZC+SzYCkGBZ8+8L9g95tsxt0OxIGoA0DHnFWIFA9FkcTa/Aaoxm0ylLmHGshF3Li8Q7yRlQcfJ7JH28YzpVwhwwle+hN3sPe4MwWE5PSZEoyPpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=fail (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AE2vC9EL reason="signature verification failed"; arc=none smtp.client-ip=10.30.226.201; arc=fail smtp.client-ip=160.75.25.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id D390A40CEC9C
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Mar 2025 20:11:27 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AE2vC9EL
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6gSf1sRxzG28p
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Mar 2025 19:02:58 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id A28D74275A; Tue,  4 Mar 2025 19:02:43 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AE2vC9EL
X-Envelope-From: <linux-kernel+bounces-541805-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AE2vC9EL
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id AC51241D59
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 16:25:49 +0300 (+03)
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by fgw1.itu.edu.tr (Postfix) with SMTP id 600FB3063EFE
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 16:25:49 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1FDB16586C
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CD0212B2E;
	Mon,  3 Mar 2025 13:25:33 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7C120F095;
	Mon,  3 Mar 2025 13:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741008330; cv=none; b=hkHxhp6FykX7hdR3oatkJ1PNeHrZ7hp8XXADJwRsoP++5Hp4iSwWHY6cKoloXh259Cg/qMvI9lvvYlNx4SlT3aEGSPmhSx1qjAJbZlDo0uXiDB0qdvooogfDMVQhzbNo0JMmSbDZLz+re0m62dLEkjwAX4qa10E+QlDG4ZBOxug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741008330; c=relaxed/simple;
	bh=wdhoR6ywow1PwN5lQx32sLFLsyyGs0zWpCWAU/kybBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qlaji457fPF8gj4ElLj9PWF8WrqM32BFAmDLd5EiIVtIXal1RfTP8rE3+GLNv1dm2ZDsZDQVbqiakC3MSgkyFeegRaiT9rlXkId9faQRsQFDi78yjOONmhzWu7VODmU7gwCGavRb9cVOtzxS/5ncd/J8xTCQk2ERrVCYBTkf85w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AE2vC9EL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D43CC4CED6;
	Mon,  3 Mar 2025 13:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741008329;
	bh=wdhoR6ywow1PwN5lQx32sLFLsyyGs0zWpCWAU/kybBw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AE2vC9EL+ZJH5AFoHN1UKXS2gOyOcmx1+SvK2w7Uf2aPcon+J2diYucaWf2XPXKan
	 6alVVReitG6Nqb8N9a5rWIhA0l+8EFEeGooHKwrojhEEvPQ6QmbIoxfhqX2VOql2A2
	 VWMWrNTPzQDiUqOKGak5WVDbOzkwb1rpNxFueUhlZ4QRKxYWDKzXYLdL8WQbni7F3P
	 6nKKRi71wdGzy6RSYizLyBewg1tf6Goi0NWhiwTlmwdwzMQBy5Xo7GuwfHAN8KG6Pf
	 c3ZA1llyqOzFf73lnYpdou3nwcRy+hiRbRQHZXN1b4bifkaIO3RGbO1O2/H9S0V8oN
	 xvC8zztWQrV7g==
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/vc4: hdmi: Fix some NULL vs IS_ERR() bugs
Date: Mon,  3 Mar 2025 14:25:25 +0100
Message-ID: <174100832301.41636.4338334342828265261.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <a952e2b4-d4b8-49ac-abd9-9967c50f4a80@stanley.mountain>
References: <a952e2b4-d4b8-49ac-abd9-9967c50f4a80@stanley.mountain>
Precedence: bulk
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6gSf1sRxzG28p
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741712956.83978@zpag3I9ETzCpuAYT6fUGvQ
X-ITU-MailScanner-SpamCheck: not spam

On Fri, 28 Feb 2025 12:38:17 +0300, Dan Carpenter wrote:
> The devm_platform_ioremap_resource_byname() function doesn't return NUL=
L,
> it returns error pointers.  Update the checking to match.
>=20
>=20

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime


