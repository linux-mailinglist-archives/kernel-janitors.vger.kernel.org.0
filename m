Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 435E8177AA1
	for <lists+kernel-janitors@lfdr.de>; Tue,  3 Mar 2020 16:38:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730061AbgCCPhu (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 3 Mar 2020 10:37:50 -0500
Received: from mga14.intel.com ([192.55.52.115]:42890 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727972AbgCCPhu (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 3 Mar 2020 10:37:50 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Mar 2020 07:37:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; 
   d="scan'208";a="412777799"
Received: from jinzhiti-mobl2.amr.corp.intel.com (HELO [10.255.230.140]) ([10.255.230.140])
  by orsmga005.jf.intel.com with ESMTP; 03 Mar 2020 07:37:48 -0800
Subject: Re: [PATCH] ASoC: SOF: Fix snd_sof_ipc_stream_posn()
To:     Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
        kernel-janitors@vger.kernel.org,
        Keyon Jie <yang.jie@linux.intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Slawomir Blauciak <slawomir.blauciak@linux.intel.com>,
        Mark Brown <broonie@kernel.org>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>
References: <20200303101858.ytehbrivocyp3cnf@kili.mountain>
 <alpine.DEB.2.21.2003031321410.2957@eliteleevi.tm.intel.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <993233ff-1492-5a87-1026-09af76f6fc7f@linux.intel.com>
Date:   Tue, 3 Mar 2020 09:36:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2003031321410.2957@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



>> We're passing "&posn" instead of "posn" so it ends up corrupting
>> memory instead of doing something useful.
> [...]
>>   	/* send IPC to the DSP */
>>   	err = sof_ipc_tx_message(sdev->ipc,
>> -				 stream.hdr.cmd, &stream, sizeof(stream), &posn,
>> +				 stream.hdr.cmd, &stream, sizeof(stream), posn,
>>   				 sizeof(*posn));
> 
> ack, thanks, this is clearly wrong. This function is not used by current
> platforms, so the bug has gone unnnoticed. Most platforms either rely on
> direct MMIO queries of the DSP position, or the periodic position updates
> DSPs send after each ALSA period. This function for host to query DSP
> position via IPC is thus not used, although it's part of the generic audio
> DSP IPC interface.
> 
> For the SOF folks in CC, I wonder should we keep this function at all?
> 
> Anyways, that's probably a longer discussion, so while it's there,
> the code should be correct, so for the patch:
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

I checked all the way to 5.2 and it was never used, so indeed wondering 
what the purpose of this function was.
