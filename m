Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75777207448
	for <lists+kernel-janitors@lfdr.de>; Wed, 24 Jun 2020 15:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387915AbgFXNTI (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 24 Jun 2020 09:19:08 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:39190 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728685AbgFXNTH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 24 Jun 2020 09:19:07 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05ODHs08083219;
        Wed, 24 Jun 2020 13:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=qe2ui3V9asRZj/Z1ltLDuCg8Q+IaJ6Cvu4m+yGmcKQQ=;
 b=LcYXEZAzBwAaC3cq0cjXWW3st6noxNXP+92lFxZ+eneuuysDWs2ACjdXqrxu40zcaW9d
 Oa+4P9T6vCiz/GFqBIeGvVx5MO9ClPmF1nNsvaA+9UFpy1GsU+JdD8DWH4z+jI4FWqEO
 lorkrtHlGFcCdo+HjxOwtkpWPyppyVm+UTCgXhClcVa7+9sWJqYiUABI0XOkvR998mGE
 TQXJUzDupkY8/k42uMc2yjxtIADxQjKpefOWyoudnaIpMdAr8ToNTFVyCouxjUfgHZYW
 YC0xlVR5Jj/LsuPOzVHPTBDpIYK49NwS/9Pvpes/i/hR0QHszHwn3ppJecYuXqtrlhWt 1A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 31uusttt00-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 24 Jun 2020 13:19:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05ODI9qh030581;
        Wed, 24 Jun 2020 13:19:04 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 31uur6c3gj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 24 Jun 2020 13:19:04 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05ODJ4Qn003977;
        Wed, 24 Jun 2020 13:19:04 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 24 Jun 2020 13:19:03 +0000
Date:   Wed, 24 Jun 2020 16:18:58 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     jirislaby@gmail.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] tty: cyclades, cache HW version
Message-ID: <20200624131858.GA9972@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9661 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 spamscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006240096
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9661 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 bulkscore=0
 cotscore=-2147483648 malwarescore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006240096
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

[ Kees recently removed the uninitialized_var() variable so ancient
  code has started to print warnings.  GCC doesn't warn about
  uninitialized variables these days either.  It's been buggy for
  10 years so it's probably not an emergency.  -dan ]

Hello Jiri Slaby,

The patch 101b81590d8d: "tty: cyclades, cache HW version" from Jun
11, 2009, leads to the following static checker warning:

	drivers/tty/cyclades.c:3805 cy_pci_probe()
	error: uninitialized symbol 'mailbox'.

drivers/tty/cyclades.c
  3640  static int cy_pci_probe(struct pci_dev *pdev,
  3641                  const struct pci_device_id *ent)
  3642  {
  3643          struct cyclades_card *card;
  3644          void __iomem *addr0 = NULL, *addr2 = NULL;
  3645          char *card_name = NULL;
  3646          u32 mailbox;
                ^^^^^^^^^^^^

  3647          unsigned int device_id, nchan = 0, card_no, i, j;
  3648          unsigned char plx_ver;
  3649          int retval, irq;
  3650  
  3651          retval = pci_enable_device(pdev);
  3652          if (retval) {
  3653                  dev_err(&pdev->dev, "cannot enable device\n");
  3654                  goto err;
  3655          }
  3656  
  3657          /* read PCI configuration area */
  3658          irq = pdev->irq;
  3659          device_id = pdev->device & ~PCI_DEVICE_ID_MASK;
  3660  
  3661  #if defined(__alpha__)
  3662          if (device_id == PCI_DEVICE_ID_CYCLOM_Y_Lo) {   /* below 1M? */
  3663                  dev_err(&pdev->dev, "Cyclom-Y/PCI not supported for low "
  3664                          "addresses on Alpha systems.\n");
  3665                  retval = -EIO;
  3666                  goto err_dis;
  3667          }
  3668  #endif
  3669          if (device_id == PCI_DEVICE_ID_CYCLOM_Z_Lo) {
  3670                  dev_err(&pdev->dev, "Cyclades-Z/PCI not supported for low "
  3671                          "addresses\n");
  3672                  retval = -EIO;
  3673                  goto err_dis;
  3674          }
  3675  
  3676          if (pci_resource_flags(pdev, 2) & IORESOURCE_IO) {
  3677                  dev_warn(&pdev->dev, "PCI I/O bit incorrectly set. Ignoring "
  3678                                  "it...\n");
  3679                  pdev->resource[2].flags &= ~IORESOURCE_IO;
  3680          }
  3681  
  3682          retval = pci_request_regions(pdev, "cyclades");
  3683          if (retval) {
  3684                  dev_err(&pdev->dev, "failed to reserve resources\n");
  3685                  goto err_dis;
  3686          }
  3687  
  3688          retval = -EIO;
  3689          if (device_id == PCI_DEVICE_ID_CYCLOM_Y_Lo ||
  3690                          device_id == PCI_DEVICE_ID_CYCLOM_Y_Hi) {
  3691                  card_name = "Cyclom-Y";
  3692  
  3693                  addr0 = ioremap(pci_resource_start(pdev, 0),
  3694                                  CyPCI_Yctl);
  3695                  if (addr0 == NULL) {
  3696                          dev_err(&pdev->dev, "can't remap ctl region\n");
  3697                          goto err_reg;
  3698                  }
  3699                  addr2 = ioremap(pci_resource_start(pdev, 2),
  3700                                  CyPCI_Ywin);
  3701                  if (addr2 == NULL) {
  3702                          dev_err(&pdev->dev, "can't remap base region\n");
  3703                          goto err_unmap;
  3704                  }
  3705  
  3706                  nchan = CyPORTS_PER_CHIP * cyy_init_card(addr2, 1);
  3707                  if (nchan == 0) {
  3708                          dev_err(&pdev->dev, "Cyclom-Y PCI host card with no "
  3709                                          "Serial-Modules\n");
  3710                          goto err_unmap;
  3711                  }
  3712          } else if (device_id == PCI_DEVICE_ID_CYCLOM_Z_Hi) {
                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  3713                  struct RUNTIME_9060 __iomem *ctl_addr;
  3714  
  3715                  ctl_addr = addr0 = ioremap(pci_resource_start(pdev, 0),
  3716                                  CyPCI_Zctl);
  3717                  if (addr0 == NULL) {
  3718                          dev_err(&pdev->dev, "can't remap ctl region\n");
  3719                          goto err_reg;
  3720                  }
  3721  
  3722                  /* Disable interrupts on the PLX before resetting it */
  3723                  cy_writew(&ctl_addr->intr_ctrl_stat,
  3724                                  readw(&ctl_addr->intr_ctrl_stat) & ~0x0900);
  3725  
  3726                  plx_init(pdev, irq, addr0);
  3727  
  3728                  mailbox = readl(&ctl_addr->mail_box_0);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Only initialized for PCI_DEVICE_ID_CYCLOM_Z_Hi.

  3729  
  3730                  addr2 = ioremap(pci_resource_start(pdev, 2),
  3731                                  mailbox == ZE_V1 ? CyPCI_Ze_win : CyPCI_Zwin);
  3732                  if (addr2 == NULL) {
  3733                          dev_err(&pdev->dev, "can't remap base region\n");
  3734                          goto err_unmap;
  3735                  }
  3736  
  3737                  if (mailbox == ZE_V1) {
  3738                          card_name = "Cyclades-Ze";
  3739                  } else {
  3740                          card_name = "Cyclades-8Zo";
  3741  #ifdef CY_PCI_DEBUG
  3742                          if (mailbox == ZO_V1) {
  3743                                  cy_writel(&ctl_addr->loc_addr_base, WIN_CREG);
  3744                                  dev_info(&pdev->dev, "Cyclades-8Zo/PCI: FPGA "
  3745                                          "id %lx, ver %lx\n", (ulong)(0xff &
  3746                                          readl(&((struct CUSTOM_REG *)addr2)->
  3747                                                  fpga_id)), (ulong)(0xff &
  3748                                          readl(&((struct CUSTOM_REG *)addr2)->
  3749                                                  fpga_version)));
  3750                                  cy_writel(&ctl_addr->loc_addr_base, WIN_RAM);
  3751                          } else {
  3752                                  dev_info(&pdev->dev, "Cyclades-Z/PCI: New "
  3753                                          "Cyclades-Z board.  FPGA not loaded\n");
  3754                          }
  3755  #endif
  3756                          /* The following clears the firmware id word.  This
  3757                             ensures that the driver will not attempt to talk to
  3758                             the board until it has been properly initialized.
  3759                           */
  3760                          if ((mailbox == ZO_V1) || (mailbox == ZO_V2))
  3761                                  cy_writel(addr2 + ID_ADDRESS, 0L);
  3762                  }
  3763  
  3764                  retval = cyz_load_fw(pdev, addr2, addr0, irq);
  3765                  if (retval <= 0)
  3766                          goto err_unmap;
  3767                  nchan = retval;
  3768          }
  3769  
  3770          if ((cy_next_channel + nchan) > NR_PORTS) {
  3771                  dev_err(&pdev->dev, "Cyclades-8Zo/PCI found, but no "
  3772                          "channels are available. Change NR_PORTS in "
  3773                          "cyclades.c and recompile kernel.\n");
  3774                  goto err_unmap;
  3775          }
  3776          /* fill the next cy_card structure available */
  3777          for (card_no = 0; card_no < NR_CARDS; card_no++) {
  3778                  card = &cy_card[card_no];
  3779                  if (card->base_addr == NULL)
  3780                          break;
  3781          }
  3782          if (card_no == NR_CARDS) {      /* no more cy_cards available */
  3783                  dev_err(&pdev->dev, "Cyclades-8Zo/PCI found, but no "
  3784                          "more cards can be used. Change NR_CARDS in "
  3785                          "cyclades.c and recompile kernel.\n");
  3786                  goto err_unmap;
  3787          }
  3788  
  3789          if (device_id == PCI_DEVICE_ID_CYCLOM_Y_Lo ||
  3790                          device_id == PCI_DEVICE_ID_CYCLOM_Y_Hi) {
  3791                  /* allocate IRQ */
  3792                  retval = request_irq(irq, cyy_interrupt,
  3793                                  IRQF_SHARED, "Cyclom-Y", card);
  3794                  if (retval) {
  3795                          dev_err(&pdev->dev, "could not allocate IRQ\n");
  3796                          goto err_unmap;
  3797                  }
  3798                  card->num_chips = nchan / CyPORTS_PER_CHIP;
  3799          } else {

There are several other PCI devices besides PCI_DEVICE_ID_CYCLOM_Z_Hi.

  3800                  struct FIRM_ID __iomem *firm_id = addr2 + ID_ADDRESS;
  3801                  struct ZFW_CTRL __iomem *zfw_ctrl;
  3802  
  3803                  zfw_ctrl = addr2 + (readl(&firm_id->zfwctrl_addr) & 0xfffff);
  3804  
  3805                  card->hw_ver = mailbox;
                                       ^^^^^^^
Uninitialized.

  3806                  card->num_chips = (unsigned int)-1;
  3807                  card->board_ctrl = &zfw_ctrl->board_ctrl;
  3808  #ifdef CONFIG_CYZ_INTR
  3809                  /* allocate IRQ only if board has an IRQ */
  3810                  if (irq != 0 && irq != 255) {
  3811                          retval = request_irq(irq, cyz_interrupt,
  3812                                          IRQF_SHARED, "Cyclades-Z", card);
  3813                          if (retval) {
  3814                                  dev_err(&pdev->dev, "could not allocate IRQ\n");
  3815                                  goto err_unmap;
  3816                          }
  3817                  }
  3818  #endif                          /* CONFIG_CYZ_INTR */
  3819          }
  3820  
  3821          /* set cy_card */
  3822          card->base_addr = addr2;
  3823          card->ctl_addr.p9050 = addr0;
  3824          card->irq = irq;
  3825          card->bus_index = 1;
  3826          card->first_line = cy_next_channel;
  3827          card->nports = nchan;

regards,
dan carpenter
