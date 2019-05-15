Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4EF61EC40
	for <lists+kernel-janitors@lfdr.de>; Wed, 15 May 2019 12:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfEOKpY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 15 May 2019 06:45:24 -0400
Received: from mga05.intel.com ([192.55.52.43]:2882 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725974AbfEOKpY (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 May 2019 06:45:24 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 May 2019 03:45:24 -0700
X-ExtLoop1: 1
Received: from rajeev-desktop.iind.intel.com (HELO intel.com) ([10.223.25.113])
  by orsmga001.jf.intel.com with ESMTP; 15 May 2019 03:45:22 -0700
Date:   Wed, 15 May 2019 16:14:59 +0530
From:   Rushikesh S Kadam <rushikesh.s.kadam@intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Guenter Roeck <groeck@chromium.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: [bug report] platform/chrome: Add ChromeOS EC ISHTP driver
Message-ID: <20190515104459.GA31364@intel.com>
References: <20190514210846.GA6848@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514210846.GA6848@mwanda>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan

On Wed, May 15, 2019 at 12:08:46AM +0300, Dan Carpenter wrote:
> Hello Rushikesh S Kadam,
> 
> The patch 4f346361cf42: "platform/chrome: Add ChromeOS EC ISHTP
> driver" from May 4, 2019, leads to the following static checker
> warning:
> 
> drivers/platform/chrome/cros_ec_ishtp.c:527 cros_ec_pkt_xfer_ish()
> warn: inconsistent returns 'read_sem:&init_lock'.
>   Locked on:   line 475
>                line 482
>   Unlocked on: line 467
>                line 527
> 
> drivers/platform/chrome/cros_ec_ishtp.c
>    450  static int cros_ec_pkt_xfer_ish(struct cros_ec_device *ec_dev,
>    451                                  struct cros_ec_command *msg)
>    452  {
>    453          int rv;
>    454          struct ishtp_cl *cros_ish_cl = ec_dev->priv;
>    455          struct ishtp_cl_data *client_data = ishtp_get_client_data(cros_ish_cl);
>    456          struct device *dev = cl_data_to_dev(client_data);
>    457          struct cros_ish_in_msg *in_msg = (struct cros_ish_in_msg *)ec_dev->din;
>    458          struct cros_ish_out_msg *out_msg =
>    459                  (struct cros_ish_out_msg *)ec_dev->dout;
>    460          size_t in_size = sizeof(struct cros_ish_in_msg) + msg->insize;
>    461          size_t out_size = sizeof(struct cros_ish_out_msg) + msg->outsize;
>    462  
>    463          /* Proceed only if reset-init is not in progress */
>    464          if (!down_read_trylock(&init_lock)) {
>    465                  dev_warn(dev,
>    466                           "Host is not ready to send messages to ISH. Try again\n");
>    467                  return -EAGAIN;
>    468          }
>    469  
>    470          /* Sanity checks */
>    471          if (in_size > ec_dev->din_size) {
>    472                  dev_err(dev,
>    473                          "Incoming payload size %zu is too large for ec_dev->din_size %d\n",
>    474                          in_size, ec_dev->din_size);
>    475                  return -EMSGSIZE;
>                         ^^^^^^^^^^^^^^^^^
>    476          }
>    477  
>    478          if (out_size > ec_dev->dout_size) {
>    479                  dev_err(dev,
>    480                          "Outgoing payload size %zu is too large for ec_dev->dout_size %d\n",
>    481                          out_size, ec_dev->dout_size);
>    482                  return -EMSGSIZE;
>                         ^^^^^^^^^^^^^^^^^
> Could we move these sanity checks to before we take the lock?  Otherwise
> we need to goto end_error;

Thanks for reporting. I submitted updated patch
with fix here https://lkml.org/lkml/2019/5/15/263

Regards
Rushikesh



> 
>    483          }
>    484  
>    485          /* Prepare the package to be sent over ISH TP */
>    486          out_msg->hdr.channel = CROS_EC_COMMAND;
>    487          out_msg->hdr.status = 0;
>    488  
>    489          ec_dev->dout += OUT_MSG_EC_REQUEST_PREAMBLE;
>    490          cros_ec_prepare_tx(ec_dev, msg);
>    491          ec_dev->dout -= OUT_MSG_EC_REQUEST_PREAMBLE;
>    492  
>    493          dev_dbg(dev,
>    494                  "out_msg: struct_ver=0x%x checksum=0x%x command=0x%x command_ver=0x%x data_len=0x%x\n",
>    495                  out_msg->ec_request.struct_version,
>    496                  out_msg->ec_request.checksum,
>    497                  out_msg->ec_request.command,
>    498                  out_msg->ec_request.command_version,
>    499                  out_msg->ec_request.data_len);
>    500  
>    501          /* Send command to ISH EC firmware and read response */
>    502          rv = ish_send(client_data,
>    503                        (u8 *)out_msg, out_size,
>    504                        (u8 *)in_msg, in_size);
>    505          if (rv < 0)
>    506                  goto end_error;
>    507  
>    508          rv = prepare_cros_ec_rx(ec_dev, in_msg, msg);
>    509          if (rv)
>    510                  goto end_error;
>    511  
>    512          rv = in_msg->ec_response.data_len;
>    513  
>    514          dev_dbg(dev,
>    515                  "in_msg: struct_ver=0x%x checksum=0x%x result=0x%x data_len=0x%x\n",
>    516                  in_msg->ec_response.struct_version,
>    517                  in_msg->ec_response.checksum,
>    518                  in_msg->ec_response.result,
>    519                  in_msg->ec_response.data_len);
>    520  
>    521  end_error:
>    522          if (msg->command == EC_CMD_REBOOT_EC)
>    523                  msleep(EC_REBOOT_DELAY_MS);
>    524  
>    525          up_read(&init_lock);
>    526  
>    527          return rv;
>    528  }
> 
> regards,
> dan carpenter

-- 
