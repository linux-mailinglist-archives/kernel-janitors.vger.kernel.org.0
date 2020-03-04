Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24133178B15
	for <lists+kernel-janitors@lfdr.de>; Wed,  4 Mar 2020 08:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728389AbgCDHHP (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 4 Mar 2020 02:07:15 -0500
Received: from mga14.intel.com ([192.55.52.115]:46543 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726860AbgCDHHP (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Mar 2020 02:07:15 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Mar 2020 23:07:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,513,1574150400"; 
   d="scan'208";a="439028720"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.249.39.20])
  by fmsmga005.fm.intel.com with ESMTP; 03 Mar 2020 23:07:12 -0800
Date:   Wed, 4 Mar 2020 08:07:11 +0100
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
        kernel-janitors@vger.kernel.org,
        Keyon Jie <yang.jie@linux.intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Slawomir Blauciak <slawomir.blauciak@linux.intel.com>,
        Mark Brown <broonie@kernel.org>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Fix snd_sof_ipc_stream_posn()
Message-ID: <20200304070710.GA12003@ubuntu>
References: <20200303101858.ytehbrivocyp3cnf@kili.mountain>
 <alpine.DEB.2.21.2003031321410.2957@eliteleevi.tm.intel.com>
 <993233ff-1492-5a87-1026-09af76f6fc7f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <993233ff-1492-5a87-1026-09af76f6fc7f@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Mar 03, 2020 at 09:36:29AM -0600, Pierre-Louis Bossart wrote:
> 
> 
> > > We're passing "&posn" instead of "posn" so it ends up corrupting
> > > memory instead of doing something useful.
> > [...]
> > >   	/* send IPC to the DSP */
> > >   	err = sof_ipc_tx_message(sdev->ipc,
> > > -				 stream.hdr.cmd, &stream, sizeof(stream), &posn,
> > > +				 stream.hdr.cmd, &stream, sizeof(stream), posn,
> > >   				 sizeof(*posn));
> > 
> > ack, thanks, this is clearly wrong. This function is not used by current
> > platforms, so the bug has gone unnnoticed. Most platforms either rely on
> > direct MMIO queries of the DSP position, or the periodic position updates
> > DSPs send after each ALSA period. This function for host to query DSP
> > position via IPC is thus not used, although it's part of the generic audio
> > DSP IPC interface.
> > 
> > For the SOF folks in CC, I wonder should we keep this function at all?
> > 
> > Anyways, that's probably a longer discussion, so while it's there,
> > the code should be correct, so for the patch:
> > Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> 
> I checked all the way to 5.2 and it was never used, so indeed wondering what
> the purpose of this function was.

I actually have a patch, removing that function, which I noticed as being unused 
during my VirtIO work. I think it was used by compressed.c before.

Thanks
Guennadi
