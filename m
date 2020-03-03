Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5F6177563
	for <lists+kernel-janitors@lfdr.de>; Tue,  3 Mar 2020 12:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728350AbgCCLju (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 3 Mar 2020 06:39:50 -0500
Received: from mga14.intel.com ([192.55.52.115]:26584 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728018AbgCCLju (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 3 Mar 2020 06:39:50 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Mar 2020 03:39:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; 
   d="scan'208";a="240044033"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by orsmga003.jf.intel.com with ESMTP; 03 Mar 2020 03:39:46 -0800
Date:   Tue, 3 Mar 2020 13:39:45 +0200 (EET)
From:   Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To:     Dan Carpenter <dan.carpenter@oracle.com>
cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Keyon Jie <yang.jie@linux.intel.com>,
        Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        Slawomir Blauciak <slawomir.blauciak@linux.intel.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ASoC: SOF: Fix snd_sof_ipc_stream_posn()
In-Reply-To: <20200303101858.ytehbrivocyp3cnf@kili.mountain>
Message-ID: <alpine.DEB.2.21.2003031321410.2957@eliteleevi.tm.intel.com>
References: <20200303101858.ytehbrivocyp3cnf@kili.mountain>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi, 

On Tue, 3 Mar 2020, Dan Carpenter wrote:

> We're passing "&posn" instead of "posn" so it ends up corrupting
> memory instead of doing something useful.
[...]
>  	/* send IPC to the DSP */
>  	err = sof_ipc_tx_message(sdev->ipc,
> -				 stream.hdr.cmd, &stream, sizeof(stream), &posn,
> +				 stream.hdr.cmd, &stream, sizeof(stream), posn,
>  				 sizeof(*posn));

ack, thanks, this is clearly wrong. This function is not used by current 
platforms, so the bug has gone unnnoticed. Most platforms either rely on 
direct MMIO queries of the DSP position, or the periodic position updates 
DSPs send after each ALSA period. This function for host to query DSP 
position via IPC is thus not used, although it's part of the generic audio
DSP IPC interface.

For the SOF folks in CC, I wonder should we keep this function at all? 

Anyways, that's probably a longer discussion, so while it's there, 
the code should be correct, so for the patch:
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Br, Kai
