Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0FCC178BA8
	for <lists+kernel-janitors@lfdr.de>; Wed,  4 Mar 2020 08:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728486AbgCDHp6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 4 Mar 2020 02:45:58 -0500
Received: from mga06.intel.com ([134.134.136.31]:28544 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725797AbgCDHp6 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Mar 2020 02:45:58 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Mar 2020 23:45:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,513,1574150400"; 
   d="scan'208";a="319744170"
Received: from zhangyon-mobl2.ccr.corp.intel.com (HELO [10.254.211.33]) ([10.254.211.33])
  by orsmga001.jf.intel.com with ESMTP; 03 Mar 2020 23:45:54 -0800
Subject: Re: [PATCH] ASoC: SOF: Fix snd_sof_ipc_stream_posn()
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     alsa-devel@alsa-project.org,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        kernel-janitors@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Slawomir Blauciak <slawomir.blauciak@linux.intel.com>,
        Mark Brown <broonie@kernel.org>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
References: <20200303101858.ytehbrivocyp3cnf@kili.mountain>
 <alpine.DEB.2.21.2003031321410.2957@eliteleevi.tm.intel.com>
 <993233ff-1492-5a87-1026-09af76f6fc7f@linux.intel.com>
 <20200304070710.GA12003@ubuntu>
From:   Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <3adf3c7d-7cf4-92c0-5653-465eeefd37ed@linux.intel.com>
Date:   Wed, 4 Mar 2020 15:46:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200304070710.GA12003@ubuntu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 3/4/20 3:07 PM, Guennadi Liakhovetski wrote:
> On Tue, Mar 03, 2020 at 09:36:29AM -0600, Pierre-Louis Bossart wrote:
>>
>>
>>>> We're passing "&posn" instead of "posn" so it ends up corrupting
>>>> memory instead of doing something useful.
>>> [...]
>>>>    	/* send IPC to the DSP */
>>>>    	err = sof_ipc_tx_message(sdev->ipc,
>>>> -				 stream.hdr.cmd, &stream, sizeof(stream), &posn,
>>>> +				 stream.hdr.cmd, &stream, sizeof(stream), posn,
>>>>    				 sizeof(*posn));
>>>
>>> ack, thanks, this is clearly wrong. This function is not used by current
>>> platforms, so the bug has gone unnnoticed. Most platforms either rely on
>>> direct MMIO queries of the DSP position, or the periodic position updates
>>> DSPs send after each ALSA period. This function for host to query DSP
>>> position via IPC is thus not used, although it's part of the generic audio
>>> DSP IPC interface.
>>>
>>> For the SOF folks in CC, I wonder should we keep this function at all?
>>>
>>> Anyways, that's probably a longer discussion, so while it's there,
>>> the code should be correct, so for the patch:
>>> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>>
>> I checked all the way to 5.2 and it was never used, so indeed wondering what
>> the purpose of this function was.
> 
> I actually have a patch, removing that function, which I noticed as being unused
> during my VirtIO work. I think it was used by compressed.c before.

The function was designed for getting the full picture of the pipeline 
position inside the FW, including the host position(the closest one to 
the ALSA buffer), the dai rendering position, the system timestamp, etc.

Iirc, the function could be used for precise position control, AV sync, 
hammock harbor, etc.

Handling to this IPC is already implemented in SOF firmware(which means 
we can already get it from the FW), I think nobody is calling the 
function as we haven't had the corresponding requirement yet.

Thanks,
~Keyon

> 
> Thanks
> Guennadi
> 
