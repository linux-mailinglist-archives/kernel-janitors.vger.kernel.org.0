Return-Path: <kernel-janitors+bounces-5013-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B91494E7CC
	for <lists+kernel-janitors@lfdr.de>; Mon, 12 Aug 2024 09:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70C7C1C21861
	for <lists+kernel-janitors@lfdr.de>; Mon, 12 Aug 2024 07:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9FB15C150;
	Mon, 12 Aug 2024 07:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ekhPfcBa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v74hFElO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ekhPfcBa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v74hFElO"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7431D15B0E2;
	Mon, 12 Aug 2024 07:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723447805; cv=none; b=Xa9dXlbc7xmS1ExwK/m4UOcyQPNsz4pFPs2aXlSqJyGg9V+aCXh4J5/EwR/okVHRQYwQwHdUC0vta687XBHWUuYqrKRrVr2zt8mLLU/M6L2fhbkCKIprnafyyD1yhlxPRPTEYs9fbc6Qh0lU/srbyO/XiizBylvotQQhnYT5rRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723447805; c=relaxed/simple;
	bh=ggv43w81ScIG3OS7vKr2XHhndhPAbuGC32yW+QdKpdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ReXA+9u4xfuCZQ0pZSnT7GZrUZEYpCA2oq5M68+YjE+4ej+VFdXXCZXRSBxSoveluKHEAI0y69anhlI0mWCEedGDkEup4mn0eD24s1Ez9pFhfuiLauOQbnUtHp98bbMyBrTSn3LmesJrLBaYw4Yo7PE5yb6BmVMOyVBiv0TEp/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ekhPfcBa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v74hFElO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ekhPfcBa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v74hFElO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8B55C2022C;
	Mon, 12 Aug 2024 07:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723447801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=85ZTHYXISTff7ib7JZXld7Nng4tieLpucbbA0ZLZL94=;
	b=ekhPfcBaxPWSReJ33Gxp+IVhiLM/qLhAfJ6pSYqm8odoIirVPX7F9g5V7TWu2UW4nyLarX
	zj5d3Q+YGV6emqxHZ0D+kLm4MSlU42pN+deLgzLrh82E8hnOjeA1x29/qAToiZ+drZo5/e
	d1zh/1dUZ9vSTklf2LQwg1Z1HCe0N2M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723447801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=85ZTHYXISTff7ib7JZXld7Nng4tieLpucbbA0ZLZL94=;
	b=v74hFElOy4xWD2bdpkBxti5pnVYYaD/NCQr2I8bIRgP/vMhZJ/jD82Vh8pOk4cIcLrCyON
	l7enAaJqUYO6lkDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723447801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=85ZTHYXISTff7ib7JZXld7Nng4tieLpucbbA0ZLZL94=;
	b=ekhPfcBaxPWSReJ33Gxp+IVhiLM/qLhAfJ6pSYqm8odoIirVPX7F9g5V7TWu2UW4nyLarX
	zj5d3Q+YGV6emqxHZ0D+kLm4MSlU42pN+deLgzLrh82E8hnOjeA1x29/qAToiZ+drZo5/e
	d1zh/1dUZ9vSTklf2LQwg1Z1HCe0N2M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723447801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=85ZTHYXISTff7ib7JZXld7Nng4tieLpucbbA0ZLZL94=;
	b=v74hFElOy4xWD2bdpkBxti5pnVYYaD/NCQr2I8bIRgP/vMhZJ/jD82Vh8pOk4cIcLrCyON
	l7enAaJqUYO6lkDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 370A3137BA;
	Mon, 12 Aug 2024 07:30:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Z2wvDPm5uWZpDgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 12 Aug 2024 07:30:01 +0000
Message-ID: <2af277bf-f07d-421b-8ffd-25c9761e3eed@suse.de>
Date: Mon, 12 Aug 2024 09:30:00 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/ast: astdp: fix loop timeout check
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <9dbd4d2c-0757-4d5f-aa11-7d9e665e7633@stanley.mountain>
 <8c1ad0a1-bbc5-4274-bdf5-fcf2e043a869@suse.de>
 <10624c71-d134-441f-a7e6-d757b60f54f8@stanley.mountain>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <10624c71-d134-441f-a7e6-d757b60f54f8@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.29
X-Spamd-Result: default: False [-4.29 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

Hi

Am 12.08.24 um 08:54 schrieb Dan Carpenter:
> On Mon, Aug 12, 2024 at 08:48:16AM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 12.08.24 um 08:42 schrieb Dan Carpenter:
>>> This code has an issue because it loops until "i" is set to UINT_MAX but
>>> the test for failure assumes that "i" is set to zero.  The result is that
>>> it will only print an error message if we succeed on the very last try.
>>> Reformat the loop to count forwards instead of backwards.
>>>
>>> Fixes: 2281475168d2 ("drm/ast: astdp: Perform link training during atomic_enable")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> ---
>>> v2: In version one, I introduced a bug where it would msleep(100) after failure
>>>       and that is a pointless thing to do.  Also change the loop to a for loop.
>>> ---
>>>    drivers/gpu/drm/ast/ast_dp.c | 12 +++++-------
>>>    1 file changed, 5 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
>>> index 5d07678b502c..9bc21dd6a54d 100644
>>> --- a/drivers/gpu/drm/ast/ast_dp.c
>>> +++ b/drivers/gpu/drm/ast/ast_dp.c
>>> @@ -146,18 +146,16 @@ void ast_dp_power_on_off(struct drm_device *dev, bool on)
>>>    void ast_dp_link_training(struct ast_device *ast)
>>>    {
>>>    	struct drm_device *dev = &ast->base;
>>> -	unsigned int i = 10;
>>> +	int i;
>>> -	while (i--) {
>>> +	for (i = 0; i < 10; i++) {
>>>    		u8 vgacrdc = ast_get_index_reg(ast, AST_IO_VGACRI, 0xdc);
>>>    		if (vgacrdc & AST_IO_VGACRDC_LINK_SUCCESS)
>>> -			break;
>>> -		if (i)
>>> -			msleep(100);
>>> +			return;
>>> +		msleep(100);
>> But we don't want to wait during the final iteration of this loop. If you
>> want to use the for loop, it should be something like
>>
>> for (i= 0; i < 10; ++i) {
>>
>>      if (i)
>>        msleep(100)
>>
>>      // now test vgacrdc
>> }
>>
>> Best regards
>> Thomas
> I feel like if we really hit this failure path then we won't care about the
> tenth msleep().  I can resend if you want, but I'd prefer to just leave it.

Please resend. Even if the link training ultimately fails, the rest of 
DRM keeps running. 100 msec is not so short to shrug it off IMHO.

Best regards
Thomas

>
> regards,
> dan carpenter
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


