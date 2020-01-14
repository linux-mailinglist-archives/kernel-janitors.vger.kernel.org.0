Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E07413B35A
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Jan 2020 21:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728777AbgANUFD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 Jan 2020 15:05:03 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:33604 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728733AbgANUFD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Jan 2020 15:05:03 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1irSQv-000376-D1; Tue, 14 Jan 2020 20:05:01 +0000
Subject: Re: [PATCH] ALSA: hda - fix out of bounds read on spec->smux_paths
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200114154412.365395-1-colin.king@canonical.com>
 <s5ho8v5renx.wl-tiwai@suse.de>
From:   Colin Ian King <colin.king@canonical.com>
Autocrypt: addr=colin.king@canonical.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c826c500-1573-b42b-3c72-5c9f3123d0ed@canonical.com>
Date:   Tue, 14 Jan 2020 20:05:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <s5ho8v5renx.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 14/01/2020 20:01, Takashi Iwai wrote:
> On Tue, 14 Jan 2020 16:44:12 +0100,
> Colin King wrote:
>>
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> It is possible for the call to snd_hda_get_num_conns to fail and return
>> a negative error code that gets assigned to num_conns. In that specific
>> case, the check of very large values of val against num_conns will not
>> fail the -EINVAL check and later on an out of bounds array read on
>> spec->smux_paths will occur.  Fix this by sanity checking for an error
>> return from the call to snd_hda_get_num_conns.
> 
> Thanks for the patch, but this can't happen.
> The ad1988_auto_smux_enum_put() is used only for IEC958 Playback
> Source element, and it's added in ad1988_add_spdif_mux_ctl().  And
> there at the beginning, there is already a check of the value:
> 
> 	num_conns = snd_hda_get_num_conns(codec, 0x0b) + 1;
> 	if (num_conns != 3 && num_conns != 4)
> 		return 0;
> 				
> And the snd_hda_get_num_conns() function returns the cached value,
> hence it's always same at the second and later calls, so it can't be a
> negative error.

Ah, OK, sorry about the noise.

> 
> That said, I don't think we need to apply the change as is.  But if we
> were to improve something, we can rather record this number more
> explicitly e.g. introduce a new field spec->num_spdif_mux_conns and
> keep there instead of calling snd_hda_get_num_conns() at each place.

That would seem more optimal for sure.

Colin
> 
> 
> thanks,
> 
> Takashi
> 
>>
>> Addresses-Coverity: ("Out-of-bounds read")
>> Fixes: 272f3ea31776 ("ALSA: hda - Add SPDIF mux control to AD codec auto-parser")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  sound/pci/hda/patch_analog.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/pci/hda/patch_analog.c b/sound/pci/hda/patch_analog.c
>> index 88c46b051d14..399561369495 100644
>> --- a/sound/pci/hda/patch_analog.c
>> +++ b/sound/pci/hda/patch_analog.c
>> @@ -756,9 +756,11 @@ static int ad1988_auto_smux_enum_put(struct snd_kcontrol *kcontrol,
>>  	struct ad198x_spec *spec = codec->spec;
>>  	unsigned int val = ucontrol->value.enumerated.item[0];
>>  	struct nid_path *path;
>> -	int num_conns = snd_hda_get_num_conns(codec, 0x0b) + 1;
>> +	int num_conns = snd_hda_get_num_conns(codec, 0x0b);
>>  
>> -	if (val >= num_conns)
>> +	if (num_conns < 0)
>> +		return num_conns;
>> +	if (val >= num_conns + 1)
>>  		return -EINVAL;
>>  	if (spec->cur_smux == val)
>>  		return 0;
>> -- 
>> 2.24.0
>>

