Return-Path: <kernel-janitors+bounces-1786-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D103D85AA7A
	for <lists+kernel-janitors@lfdr.de>; Mon, 19 Feb 2024 19:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CABE28370D
	for <lists+kernel-janitors@lfdr.de>; Mon, 19 Feb 2024 18:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC3D47F50;
	Mon, 19 Feb 2024 18:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="hL2FC/PY"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A1740BE3
	for <kernel-janitors@vger.kernel.org>; Mon, 19 Feb 2024 18:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708365616; cv=none; b=WPF0HfDahJ8W8iTcY7csWXF0y7CzRoq7lTyy4TweMZFn02+sa1PtB1PNcH2earXF09rvh7pXdoN4ylmuka4EcYOkwe6UVKtEu4hFanJ3jyTmBulmBUHByV6MH8RgWgc/aum/ritJEuZolx1SpAhshaOe9eVhDhe3PCK4QBZHjRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708365616; c=relaxed/simple;
	bh=DdJ+JPoHBEw3IODe8oZcYF1OwcZG3gCPKyYpD6UWBuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F2zI9/N/zVloODz9dLIVkEwhXZKIeoVRE8dRa4s0964N6PQsfjfDcZkh7R4erqOd6aOMFXeMD71V//DVOOrszC2Qq9Mzu96qIlMeD3KYskaA9A0ATXU862SGVJnpyn2NXql5/Fh0wOqOVExNer4nBuCeEv7ehlG8T9DHI8XAAxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=hL2FC/PY; arc=none smtp.client-ip=80.12.242.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.18] ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id c7uwr4K1Rb1Jlc7uwrZn6h; Mon, 19 Feb 2024 18:59:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1708365545;
	bh=ti6upGoRyyrC2hvsjOkpJVRvXntoJTVQ7/Zs/uqxjT4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hL2FC/PYBaouzvlBBq79Hga/FRp5lg0G/W0pv0oEN7ZYTyC6Gf3gvHnHNw0Chyxy3
	 FEBM012Ssb3ZtdercwRyvz8fiFGb/WOFilLBBKWlE//OA8lgUKJ9csKadViwxkI0ry
	 t6h6RUTjQLA0vzgEG5S5pymbbZLTHLuX45NWMKnn7JTrIbTkZXPIGrjWBufil8a87Q
	 Q3EbREOG9yH1CFM3FTepq/D7O8VcQnCYZiD+AsuA4vqGnDdep+v7gGh2yhnrYRnUUH
	 bJSAvWeNGVO49Iznz8JoOuCSirJw5+4S/PA0MLr0oSlnvzzprX0Ji6NcET/oWbYYCw
	 mFmzV1c/a833Q==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 19 Feb 2024 18:59:05 +0100
X-ME-IP: 92.140.202.140
Message-ID: <3fe4c327-b69b-464e-8e4e-005fa1813279@wanadoo.fr>
Date: Mon, 19 Feb 2024 18:59:02 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] udmabuf: Fix a potential (and unlikely) access to
 unallocated memory
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gustavo@embeddedor.com, keescook@chromium.org,
 Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <f75d0426a17b57dbddacd7da345c1c62a3dbb7ce.1708278363.git.christophe.jaillet@wanadoo.fr>
 <91d964c2-3d5a-4e96-a4db-e755455c5b5c@moroto.mountain>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <91d964c2-3d5a-4e96-a4db-e755455c5b5c@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 19/02/2024 à 09:37, Dan Carpenter a écrit :
> On Sun, Feb 18, 2024 at 06:46:44PM +0100, Christophe JAILLET wrote:
>> If 'list_limit' is set to a very high value, 'lsize' computation could
>> overflow if 'head.count' is big enough.
>>
> 
> The "list_limit" is set via module parameter so if you set that high
> enough to lead to an integer overflow then you kind of deserve what
> you get.
> 
> This patch is nice for kernel hardening and making the code easier to
> read/audit but the real world security impact is negligible.

Agreed.

That is what I meant by "and unlikely".
Maybe the commit message could be more explicit if needed.

Let me know if ok as-is or if I should try to re-word the description.

CJ

> 
> regards,
> dan carpenter
> 
> 
> 


