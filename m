Return-Path: <kernel-janitors+bounces-6159-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E599AA23B
	for <lists+kernel-janitors@lfdr.de>; Tue, 22 Oct 2024 14:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7DA1283069
	for <lists+kernel-janitors@lfdr.de>; Tue, 22 Oct 2024 12:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181D419DF41;
	Tue, 22 Oct 2024 12:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgbNgDpO"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CD519D8BC;
	Tue, 22 Oct 2024 12:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729600695; cv=none; b=LtAgJccmoKPSQAvQKuPvK0zqXf+KEWcmYxLoHtaVqQ7BSsTvAe2nCUEYmPFvOOTY2i+3e7DXSz1eGasGf17zwvV2AzHyNIHSD+9VCaPYWHLzY+mZZk5RF6LRVg2rPr44n8iCmVTYpgcTFNocqT4IYTqurJ7+cgRmp28aIurgUiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729600695; c=relaxed/simple;
	bh=DLgB0RyK7HecqWHWaSWB1KTGQ554aUd6uSiDOmYkCe0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rjV0dV7yZinP0HPfzjJEg7s1MzxxIrL4P9C4Z52HBPf0zfwUJHG9AuRBcg/12/P7DRBliBluKrK2L3jwiCnowQnesx6AKl4XH3hBS5ZNLn4T+rgR6VdYvuLdL+2oMdXgNKbZEQ16VyNrY6OvKBocWbd4IkcVQcRJUmf3jh6swf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cgbNgDpO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729600694; x=1761136694;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=DLgB0RyK7HecqWHWaSWB1KTGQ554aUd6uSiDOmYkCe0=;
  b=cgbNgDpOHra8yBzY/KVO35hnHC2CvN8Vv7OhvSjeUyI9L0qPeprN03te
   CqWyqW5fRb7Lcty78WuB/63elGgKYehkCKGazK7sazjXWv363HB69T3bA
   4l/6nFuCwg4+n1F7D7dPNwdzLZqVY3A3cRI6S8PygBlTkLUWFSp9rafC4
   zEa9n68+pFAj8MFaYZBF/s2Dg0YvmN9S6O1U+8RnszVxvxkjwH3TLA96b
   EdcsBQcs/wRKZBRxTIOgS2dl0xkbjcjnZe5C8999R8ehPvBU60x1zM4H9
   oWT3C8jZa566h2f1H8GhQvmMvx9HuApDSOLHCGIg4AHhk8/cWXg7M9svN
   Q==;
X-CSE-ConnectionGUID: tRIQhaxpRWi/VlN38cX+aw==
X-CSE-MsgGUID: dAwMMA+ETuWJLP1ZW4H7Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="39750065"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="39750065"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 05:38:13 -0700
X-CSE-ConnectionGUID: O9Tb6A5AR5W9iUWUW6VQPQ==
X-CSE-MsgGUID: uVZBeJNwSIiZgxEq7MrWaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79922838"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost) ([10.245.246.4])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 05:38:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/display: Remove kstrdup_const() and
 kfree_const() usage
In-Reply-To: <6673435f-250a-4fb7-9843-20f050e85c7c@wanadoo.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <f82be2ee3ac7d18dd9982b5368a88a5bf2aeb777.1727977199.git.christophe.jaillet@wanadoo.fr>
 <87h69srz1q.fsf@intel.com>
 <6673435f-250a-4fb7-9843-20f050e85c7c@wanadoo.fr>
Date: Tue, 22 Oct 2024 15:38:06 +0300
Message-ID: <87iktkuxch.fsf@intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, 04 Oct 2024, Christophe JAILLET <christophe.jaillet@wanadoo.fr> wro=
te:
> Le 04/10/2024 =C3=A0 11:35, Jani Nikula a =C3=A9crit=C2=A0:
>> On Thu, 03 Oct 2024, Christophe JAILLET <christophe.jaillet@wanadoo.fr> =
wrote:
>>> kstrdup_const() and kfree_const() can be confusing in code built as a
>>> module. In such a case, it does not do what one could expect from the n=
ame
>>> of the functions.
>>>
>>> The code is not wrong by itself, but in such a case, it is equivalent to
>>> kstrdup() and kfree().
>>>
>>> So, keep thinks simple and straightforward.
>>>
>>> This reverts commit 379b63e7e682 ("drm/i915/display: Save a few bytes of
>>> memory in intel_backlight_device_register()")
>>=20
>> Sorry, I guess I'm confused here. Or I just didn't read the commit
>> message to [1] properly. Or both.
>>=20
>> So the whole point of [1] was that the _const versions can be confusing
>> if i915 is builtin? But not wrong?
>
> I'll try to explain the whole story and (try to) be clearer.

Thanks for the thorough explanations, pushed to drm-intel-next.

BR,
Jani.

>
>
> [2] the intent of this initial patch was a micro-optimization which was=20
> expected to save a few bytes of memory. The naming of the function=20
> looked promising. However kstrdup_const() only saves the allocation=20
> within the rodata section of the kernel [5,6]. The mechanism does not=20
> work for code built as module.
>
> This patch *is not* broken by itself, it is just pointless most of the=20
> time. So keeping it as-is is just fine, from my point of view.
>
> If built as a module, kstrdup_const() is just a plain kstrdup() and=20
> kfree_const() is just kfree().
>
>
>
> [3] was a variation that tried to avoid the allocation in all cases,=20
> should it be built as a module or not.
> Being a micro-optimization of a slow path, your argument of keeping=20
> things simple is just fine for me.
>
>
>
> [4] just revert [2].
> [2] was not broken, so [4] does not fix anything. It just makes things=20
> simpler and as before.
>
>
> So the whole point of [1,3] was that the _const versions can be=20
> confusing if i915 is *NOT* builtin.
> But it *is* not wrong, just likely useless in such a case.
>
> So, from my point of view, keeping [2] as is, or applying [3] or [4] on=20
> top of it does not change things much, and each solution is correct.
>
>
>
> The idea behind removing some usage of _const() function in modules is=20
> related to the patch proposal [7] and more precisely the response of=20
> Christoph Hellwig [8]. The patch [7] will not be applied because it=20
> breaks things.
> So, should this API be removed one day, or at least removed for modules,=
=20
> the more preparation work is already done (up to now: 4,9,10] the better=
=20
> it is.
>
> CJ
>
>
>
> [2]: 379b63e7e682 ("drm/i915/display: Save a few bytes of memory in=20
> intel_backlight_device_register()")
>
> [3]:=20
> https://lore.kernel.org/all/3b3d3af8739e3016f3f80df0aa85b3c06230a385.1727=
533674.git.christophe.jaillet@wanadoo.fr/
>
> [4]:=20
> https://lore.kernel.org/all/f82be2ee3ac7d18dd9982b5368a88a5bf2aeb777.1727=
977199.git.christophe.jaillet@wanadoo.fr/
>
> [5]: https://elixir.bootlin.com/linux/v6.12-rc1/source/mm/util.c#L84
> [6]:=20
> https://elixir.bootlin.com/linux/v6.12-rc1/source/include/asm-generic/sec=
tions.h#L177
>
> [7]:=20
> https://lore.kernel.org/all/20240924050937.697118-1-senozhatsky@chromium.=
org/
> [8]: https://lore.kernel.org/all/ZvJfhDrv-eArtU8Y@infradead.org/
>
> [9]:=20
> https://lore.kernel.org/all/63ac20f64234b7c9ea87a7fa9baf41e8255852f7.1727=
374631.git.christophe.jaillet@wanadoo.fr/
> [10]:=20
> https://lore.kernel.org/all/06630f9ec3e153d0e7773b8d97a17e7c53e0d606.1727=
375615.git.christophe.jaillet@wanadoo.fr/
>
>>=20
>> BR,
>> Jani.
>>=20
>>=20
>> [1] https://lore.kernel.org/r/3b3d3af8739e3016f3f80df0aa85b3c06230a385.1=
727533674.git.christophe.jaillet@wanadoo.fr
>>=20
>>=20
>>=20
>>>
>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>> ---
>>>   drivers/gpu/drm/i915/display/intel_backlight.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/g=
pu/drm/i915/display/intel_backlight.c
>>> index 9e05745d797d..3f81a726cc7d 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_backlight.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_backlight.c
>>> @@ -949,7 +949,7 @@ int intel_backlight_device_register(struct intel_co=
nnector *connector)
>>>   	else
>>>   		props.power =3D BACKLIGHT_POWER_OFF;
>>>=20=20=20
>>> -	name =3D kstrdup_const("intel_backlight", GFP_KERNEL);
>>> +	name =3D kstrdup("intel_backlight", GFP_KERNEL);
>>>   	if (!name)
>>>   		return -ENOMEM;
>>>=20=20=20
>>> @@ -963,7 +963,7 @@ int intel_backlight_device_register(struct intel_co=
nnector *connector)
>>>   		 * compatibility. Use unique names for subsequent backlight devices=
 as a
>>>   		 * fallback when the default name already exists.
>>>   		 */
>>> -		kfree_const(name);
>>> +		kfree(name);
>>>   		name =3D kasprintf(GFP_KERNEL, "card%d-%s-backlight",
>>>   				 i915->drm.primary->index, connector->base.name);
>>>   		if (!name)
>>> @@ -987,7 +987,7 @@ int intel_backlight_device_register(struct intel_co=
nnector *connector)
>>>   		    connector->base.base.id, connector->base.name, name);
>>>=20=20=20
>>>   out:
>>> -	kfree_const(name);
>>> +	kfree(name);
>>>=20=20=20
>>>   	return ret;
>>>   }
>>=20
>

--=20
Jani Nikula, Intel

